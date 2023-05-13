data "external" "get_my_public_ip" {
  program = ["bash", "rds/get_my_public_ip.sh"]
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name = "rds-cloud-computing-sg"
  # description = "RDS PostgreSQL security group"
  description = "RDS Mysql security group"
  #   vpc_id      = var.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      # from_port   = 5432
      # to_port     = 5432
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      description = "Allow network from EKS in another aws account"
      #   description = "PostgreSQL access from within K8s worker nodes"
      #   cidr_blocks = var.cluster_worker_sg_id
      # cidr_blocks = "${var.eks_nat_gateway_eip[0]}/32"
      cidr_blocks = "${var.eks_nat_gateway_eip}/32"
    },

    {
      type        = "ingress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "Allow network from my local to rds"
      cidr_blocks = "${data.external.get_my_public_ip.result.my_public_ip}/32"
    }

  ]

  tags = {
    Terraform   = "true",
    Project     = "cloud-computing",
    Environment = "production",
  }
}

