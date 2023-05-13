# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account
resource "google_service_account" "kubernetes" {
  account_id   = "kubernetes-admin"
  display_name = "kubernetes-admin"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool
resource "google_container_node_pool" "general" {
  name       = "general"
  cluster    = google_container_cluster.primary.id
  node_count = var.nodecount



  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = false
    machine_type = var.nodetype

    min_count    = var.minnode
    max_count    = var.maxnode
    disk_size_gb = var.disksize

    labels = {
      "role" = "general"
    }

    service_account = google_service_account.kubernetes.email
    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}

resource "google_container_node_pool" "general2" {
  name       = "general2"
  cluster    = google_container_cluster.primary.id
  node_count = var.nodecount

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = false
    machine_type = var.nodetype

    min_count    = var.minnode
    max_count    = var.maxnode
    disk_size_gb = var.disksize

    labels = {
      "role" = "general2"
    }

    service_account = google_service_account.kubernetes.email
    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}
