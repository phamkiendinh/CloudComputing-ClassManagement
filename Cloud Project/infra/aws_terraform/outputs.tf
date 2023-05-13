# # RDS
# output "rds_host_address" {
#   value = module.rds.rds_host_address
# }

# output "rds_db_name" {
#   value = module.rds.rds_db_name
# }

# output "rds_db_port" {
#   value = module.rds.rds_db_port
# }

# output "rds_db_username" {
#   value     = module.rds.rds_db_username
#   sensitive = false
# }

# output "rds_db_password" {
#   value     = module.rds.rds_db_password
#   sensitive = false
# }


# # ECR
# output "fe_repo_url" {
#   description = "URL fe repo ECR"
#   value       = module.ecr.fe_repo_url
# }

# output "be_repo_url" {
#   description = "URL be repo ECR"
#   value       = module.ecr.be_repo_url
# }

# EKS
# output "eks_nat_gateway_eip" {
#   description = "Public IP attached to the NAT gateway of the EKS cluster to allow inbound for RDS"
#   value       = module.eks.nat_gateway_eip
# }

# output "cluster_id" {
#   description = "EKS cluster ID"
#   value       = module.eks.cluster_id
# }

# output "cluster_endpoint" {
#   description = "Endpoint for EKS control plane"
#   value       = module.eks.cluster_endpoint
# }

output "load_balancer_dns_hostname" {
  description = "DNS hostname address of the load balancer"
  value       = module.eks.load_balancer_dns_hostname
}

