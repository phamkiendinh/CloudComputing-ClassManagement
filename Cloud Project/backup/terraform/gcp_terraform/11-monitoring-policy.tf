resource "google_project_iam_member" "monitoring" {
  role    = "roles/monitoring.metricWriter"
  member  = "user:${var.my-service-account}"
  project = var.project
}
