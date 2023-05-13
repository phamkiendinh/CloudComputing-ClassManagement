output "cluster_id" {
  description = "EKS cluster ID"
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}

output "cluster_worker_sg_id" {
  description = "Security group ids attached to the cluster worker nodes"
  value       = module.eks.node_security_group_id
}

output "vpc_public_subnets" {
  description = "Public subnets of the vpc"
  value       = module.vpc.public_subnets

}

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "nat_gateway_eip" {
  description = "Public IP attached to the NAT gateway of the EKS cluster to allow inbound for RDS"
  value       = module.vpc.nat_public_ips
}

output "load_balancer_dns_hostname" {
  description = "DNS hostname address of the load balancer"
  value       = data.kubernetes_service.nginx_ingress_controller.status.0.load_balancer.0.ingress.0.hostname
}
