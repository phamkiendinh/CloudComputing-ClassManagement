# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/containter_cluster
resource "google_container_cluster" "primary" {
  name     = var.name
  location = var.location
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  network                  = google_compute_network.main.self_link
  subnetwork               = google_compute_subnetwork.private.self_link
  # logging_service          = "logging.googleapis.com/kubernetes"
  # monitoring_service       = "monitoring.googleapis.com/kubernetes"
  # logging_service          = "none"
  # monitoring_service       = "none"


  networking_mode          = "VPC_NATIVE"

  # node_locations = [
  #   # "europe-west6-b",
  #   # "europe-west6-c",
  # ]

  addons_config {
    http_load_balancing {
      # we use nginx ingress
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = true
    }
  }

  release_channel {
    channel = "REGULAR"
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "k8s-pod-range"
    services_secondary_range_name = "k8s-service-range"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }


  # workload_identity_config {
  #  workload_pool = "elliptical-feat-385302.svc.id.goog"
  # }

  # # jenkins use case
  # master_authorized_networks_config {
  #   cidr_blocks {
  #     cidr_block   = var.whitelist-ips[0]
  #     display_name = "butschi-home"
  #   }
  # }
}

resource "null_resource" "configure_gke_context" {
  provisioner "local-exec" {
    command = "gcloud --project ${var.project} container clusters get-credentials ${var.name} --region ${var.location}"
  }
  depends_on = [
    google_container_cluster.primary
  ]
}
