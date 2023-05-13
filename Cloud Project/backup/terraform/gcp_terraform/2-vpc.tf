# resource "google_project_service" "compute" {
#   service                    = "compute.googleapis.com"
#   disable_dependent_services = true
# }

# resource "google_project_service" "container" {
#   service                    = "container.googleapis.com"
#   disable_dependent_services = true
# }

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
resource "google_compute_network" "main" {
  name                    = "minh-gke-vpc"
  auto_create_subnetworks = false
  project                 = var.project
  routing_mode            = "REGIONAL"

  # depends_on = [
  #   google_project_service.compute,
  #   google_project_service.container
  # ]
}
