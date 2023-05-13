output "fe_repo_url" {
  description = "URL fe repo ECR"
  value       = module.ecr_fe_public.repository_url
}

output "be_repo_url" {
  description = "URL be repo ECR"
  value       = module.ecr_be_public.repository_url
}
