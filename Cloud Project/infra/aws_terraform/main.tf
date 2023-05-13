provider "aws" {
  region  = "us-east-1"
  profile = "admin-minh"
}


module "eks" {
  source = "./eks"

  // Pass provider variables to the child module
  aws_region  = "us-east-1"
  aws_profile = "admin-minh"
}

# module "ecr" {
#   source = "./ecr"
# }

# provider "aws" {
#   alias   = "rds"
#   region  = "us-east-1"
#   profile = "phat-rds-cloud-computing"
# }

# From different account
# module "rds" {
#   source = "./rds"
#   # cluster_worker_sg_id = module.eks.cluster_worker_sg_id
#   # vpc_public_subnets   = module.eks.vpc_public_subnets
#   # vpc_id               = module.eks.vpc_id
#   # eks_nat_gateway_eip = module.eks.nat_gateway_eip
#    eks_nat_gateway_eip = "34.65.182.106"


#   # providers = {
#   #   aws = aws.rds
#   # }
# }


module "route53" {
  source                     = "./route53"
  fe_dns_name                = "test-fe.bug-fix-squad.com"
  be_dns_name                = "test-be.bug-fix-squad.com"
  load_balancer_dns_hostname = module.eks.load_balancer_dns_hostname
}
