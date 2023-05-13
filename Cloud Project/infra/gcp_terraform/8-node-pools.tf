# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account
resource "google_service_account" "kubernetes" {
  account_id   = "kubernetes-admin"
  display_name = "kubernetes-admin"
}

resource "google_service_account_key" "my_key" {
  service_account_id = google_service_account.kubernetes.email
  public_key_type    = "TYPE_X509_PEM_FILE"

}

### Binding Service Account with IAM
resource "google_project_iam_binding" "sa_binding_monitor" {
  project = var.project
  role    = "roles/monitoring.metricWriter"
  members = [
    "serviceAccount:${google_service_account.kubernetes.email}"
  ]
}

resource "google_project_iam_binding" "sa_binding_log" {
  project = var.project
  role    = "roles/logging.logWriter"
  members = [
    "serviceAccount:${google_service_account.kubernetes.email}"
  ]
}

resource "google_project_iam_binding" "grant_gke_permission" {
  project = var.project
  role    = "roles/container.admin"

  members = [
    "serviceAccount:${google_service_account.kubernetes.email}"
  ]
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

    disk_size_gb = var.disksize

    labels = {
      "role" = "general"
    }

    service_account = google_service_account.kubernetes.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
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


    disk_size_gb = var.disksize
    labels = {
      "role" = "general2"
    }

    service_account = google_service_account.kubernetes.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
