module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.29.0"

  cluster_name = "cloud-computing"
  # cluster_version = "1.23"
  cluster_version = "1.26"


  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_irsa = true

  eks_managed_node_group_defaults = {
    disk_size = 50
  }

  eks_managed_node_groups = {
    general = {
      desired_size = 3
      min_size     = 1
      max_size     = 3

      labels = {
        role = "general"
      }

      instance_types = [var.ec2_instance_type]
      capacity_type  = "ON_DEMAND"
    }

    general_2 = {
      desired_size = 2
      min_size     = 1
      max_size     = 2

      labels = {
        role = "general_2"
      }

      instance_types = [var.ec2_instance_type]
      capacity_type  = "ON_DEMAND"
    }

    # spot = {
    #   desired_size = 1
    #   min_size     = 1
    #   max_size     = 2

    #   labels = {
    #     role = "spot"
    #   }

    #   taints = [{
    #     key    = "market"
    #     value  = "spot"
    #     effect = "NO_SCHEDULE"
    #   }]

    #   instance_types = [var.ec2_instance_type]
    #   capacity_type  = "SPOT"
    # }
  }

  # Add the eks-admin IAM role to the EKS cluster, we need to update the aws-auth configmap
  manage_aws_auth_configmap = true
  aws_auth_roles = [
    {
      rolearn  = module.eks_admins_iam_role.iam_role_arn
      username = module.eks_admins_iam_role.iam_role_name
      groups   = ["system:masters"]
    },
  ]

  # The last change that we need to make in our EKS cluster is to allow access from the EKS control plane to the webhook port of the AWS load balancer controller.
  node_security_group_additional_rules = {
    # ingress_allow_access_from_control_plane = {
    #   type                          = "ingress"
    #   protocol                      = "tcp"
    #   from_port                     = 9443
    #   to_port                       = 9443
    #   source_cluster_security_group = true
    #   description                   = "Allow access from control plane to webhook port of AWS load balancer controller"
    # }

    # The last change that we need to make in our EKS cluster is to allow access from the EKS control plane to the webhook port of the nginx ingress controller.
    ingress_allow_access_from_control_plane = {
      type                          = "ingress"
      protocol                      = "tcp"
      from_port                     = 8443
      to_port                       = 8443
      source_cluster_security_group = true
      description                   = "Allow access from control plane to webhook port of Nginx Ingress Controller"
    }


    # Allow nodes-nodes communication
    ingress_self_all = {
      description = "Node to node all ports/protocols"
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      type        = "ingress"
      self        = true
    }

    # Allow nodes to the internet
    egress_all = {
      description      = "Node all egress"
      protocol         = "-1"
      from_port        = 0
      to_port          = 0
      type             = "egress"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }

  }

  tags = {
    Terraform   = "true",
    Project     = "cloud-computing"
    Environment = "production"
  }
}

# Also, you need to authorize terraform to access Kubernetes API and modify aws-auth configmap. To do that, you need to define terraform kubernetes provider.
# To authenticate with the cluster, you can use either use token which has an
# expiration time or an exec block to retrieve this token on each terraform run.
# https://github.com/terraform-aws-modules/terraform-aws-eks/issues/2009
data "aws_eks_cluster" "default" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "default" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.default.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.default.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.default.token

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.default.id]
    command     = "aws"
  }
}
