# Create policy to access eks
module "allow_eks_access_iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.3.1"

  name          = "allow-eks-access"
  create_policy = true

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "eks:DescribeCluster",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}


# Create role and attach above policy to this role
module "eks_admins_iam_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "5.3.1"

  role_name         = "eks-admin"
  create_role       = true
  role_requires_mfa = false

  custom_role_policy_arns = [module.allow_eks_access_iam_policy.arn]

  trusted_role_arns = [
    "arn:aws:iam::${module.vpc.vpc_owner_id}:root"
  ]
}

# Create IAM policy to allow assume eks-admin IAM role.
module "allow_assume_eks_admins_iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.3.1"

  name          = "allow-assume-eks-admin-iam-role"
  create_policy = true

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
        ]
        Effect   = "Allow"
        Resource = module.eks_admins_iam_role.iam_role_arn
      },
    ]
  })
}

# Create a group and put our manually created admin to the group to perform action
module "eks_admins_iam_group" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "5.3.1"

  name                              = "eks-admin"
  attach_iam_self_management_policy = false
  create_group                      = true
  group_users                       = ["admin"]
  custom_group_policy_arns          = [module.allow_assume_eks_admins_iam_policy.arn]
}

# Update aws configure profile in local to allow current profile to assume eks-admin role
resource "null_resource" "configure_eks_admin_profile" {
  provisioner "local-exec" {
    command = "echo '[profile ${module.eks_admins_iam_group.group_name}]\nrole_arn = ${module.eks_admins_iam_role.iam_role_arn}\nsource_profile = ${var.aws_profile}' >> ~/.aws/config"
  }
}


# Kubernetes config to use the eks-admin IAM role.
resource "null_resource" "update_kubeconfig_to_access_aws_eks_cluster" {
  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --name ${module.eks.cluster_id} --region ${var.aws_region} --profile ${var.aws_profile}"
  }
}
