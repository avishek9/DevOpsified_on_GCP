resource "google_service_account" "jump_server_sa" {
  account_id   = "jump-server-sa"
  display_name = "Jump Server Service Account"
  project      = var.project
}