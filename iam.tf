resource "google_storage_bucket_iam_member" "member" {
  bucket = "dummyproject-429106-infra-backend"
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.tool-machine-sa.email}"
}