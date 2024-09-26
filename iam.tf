resource "google_storage_bucket_iam_member" "member" {
  bucket = "dummyproject-429106-infra-backend"
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.tool-machine-sa.email}"
}

# Grant the Service Account Admin role (for iam.serviceAccounts.create)
resource "google_project_iam_member" "service_account_admin" {
  project = var.project
  role    = "roles/iam.serviceAccountAdmin"
  member  = "serviceAccount:${google_service_account.tool-machine-sa.email}"
}

# Grant the Compute Network Admin role (for compute.networks.create, compute.addresses.create, and compute.addresses.setLabels)
resource "google_project_iam_member" "compute_network_admin" {
  project = var.project
  role    = "roles/compute.networkAdmin"
  member  = "serviceAccount:${google_service_account.tool-machine-sa.email}"
}

resource "google_project_iam_member" "sa_project_iam_admin" {
  project = var.project
  role    = "roles/resourcemanager.projectIamAdmin"
  member  = "serviceAccount:${google_service_account.tool-machine-sa.email}"
}

resource "google_project_iam_member" "jump_server_instance_admin" {
  project = var.project
  role    = "roles/compute.instanceAdmin"
  member  = "serviceAccount:${google_service_account.tool-machine-sa.email}"
}