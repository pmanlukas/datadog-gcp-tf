provider "google" {
  project     = var.gcp_project_id
  region      = var.gcp_region
}

resource "google_service_account" "datadog_integration" {
  account_id   = "datadog-integration-sa"
  display_name = "Datadog Integration Service Account"
  project      = var.gcp_project_id
}

resource "google_project_iam_binding" "monitoring_viewer_iam" {
  project = var.gcp_project_id
  role    = "roles/monitoring.viewer"

  members = [
    "serviceAccount:${google_service_account.datadog_integration.email}"
  ]
}

resource "google_project_iam_binding" "compute_viewer_iam" {
  project = var.gcp_project_id
  role    = "roles/compute.viewer"

  members = [
    "serviceAccount:${google_service_account.datadog_integration.email}"
  ]
}

resource "google_project_iam_binding" "cloud_asset_viewer_iam" {
  project = var.gcp_project_id
  role    = "roles/cloudasset.viewer"

  members = [
    "serviceAccount:${google_service_account.datadog_integration.email}"
  ]
}

resource "google_project_iam_binding" "browser_iam" {
  project = var.gcp_project_id
  role    = "roles/browser"

  members = [
    "serviceAccount:${google_service_account.datadog_integration.email}"
  ]
}

output "datadog_service_account_email" {
  value = google_service_account.datadog_integration.email
}
