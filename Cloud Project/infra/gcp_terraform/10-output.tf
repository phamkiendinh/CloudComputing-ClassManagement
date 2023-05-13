output "ingress-loadbalancer-ip" {
  description = "load balancer ip"
  value       = module.ingress-nginx.load_balancer_ip
}

output "kubernetes-public-endpoint" {
  value = "https://${google_container_cluster.primary.endpoint}"
}

output "kubernetes-nat-public-ip" {
  value = google_compute_address.nat.address
}

output "kubernetes-service-account-email" {
  value = google_service_account.kubernetes.email
}

output "kubernetes-service-account-secret-key" {
  value     = google_service_account_key.my_key.private_key
  sensitive = true
}
