# variable "cluster_worker_sg_id" {
#   description = "Security group ids attached to the cluster worker nodes"

# }

# variable "vpc_public_subnets" {
#   description = "Private subnets of the vpc"

# }

# variable "vpc_id" {
#   description = "VPC ID"
# }

variable "password" {
  # description = "RDS Postgre password"
  # default     = "postgres"
  description = "RDS Mysql password"
  default     = "mysqlpwd"
}

variable "eks_nat_gateway_eip" {
  description = "Public IP attached to the NAT gateway of the EKS cluster to allow inbound for RDS"
}
