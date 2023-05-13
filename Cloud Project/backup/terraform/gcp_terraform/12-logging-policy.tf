resource "google_project_iam_member" "logging" {
  role    = "roles/logging.logWriter"
  member  = "user:${var.my-service-account}"
  project = var.project
}
