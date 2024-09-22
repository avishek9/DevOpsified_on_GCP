terraform {
  backend "gcs" {
    bucket = "dummyproject-429106-infra-backend"
    prefix = "terraform/gke-state"
  }
}