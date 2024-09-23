resource "google_project_iam_member" "jump_server_container_admin" {
  project = var.project
  role    = "roles/container.admin" # Full access to GKE
  member  = "serviceAccount:${google_service_account.jump_server_sa.email}"
}

resource "google_project_iam_member" "jump_server_cluster_viewer" {
  project = var.project
  role    = "roles/container.clusterViewer" # View access to clusters
  member  = "serviceAccount:${google_service_account.jump_server_sa.email}"
}

resource "google_project_iam_member" "jump_server_compute_instance_admin" {
  project = var.project
  role    = "roles/compute.instanceAdmin" # Manage compute instances
  member  = "serviceAccount:${google_service_account.jump_server_sa.email}"
}

resource "google_project_iam_member" "jump_server_network_user" {
  project = var.project
  role    = "roles/compute.networkUser" # Access network resources
  member  = "serviceAccount:${google_service_account.jump_server_sa.email}"
}

resource "google_project_iam_member" "jump_server_logging_writer" {
  project = var.project
  role    = "roles/logging.logWriter" # Write logs
  member  = "serviceAccount:${google_service_account.jump_server_sa.email}"
}

resource "google_project_iam_member" "jump_server_monitoring_viewer" {
  project = var.project
  role    = "roles/monitoring.viewer" # View monitoring data
  member  = "serviceAccount:${google_service_account.jump_server_sa.email}"
}

# Grant the Service Account Admin role (for iam.serviceAccounts.create)
resource "google_project_iam_member" "service_account_admin" {
  project = var.project
  role    = "roles/iam.serviceAccountAdmin"
  member  = "serviceAccount:${google_service_account.jump_server_sa.email}"
}

# Grant the Compute Network Admin role (for compute.networks.create, compute.addresses.create, and compute.addresses.setLabels)
resource "google_project_iam_member" "compute_network_admin" {
  project = var.project
  role    = "roles/compute.networkAdmin"
  member  = "serviceAccount:${google_service_account.jump_server_sa.email}"
}