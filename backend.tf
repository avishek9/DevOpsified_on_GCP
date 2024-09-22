terraform {
  backend "gcs" {
    bucket                   = "dummyproject-429106-infra-backend"
    prefix                   = "terraform/state"
    credentials              = ".credentials.json"
    public_access_prevention = "enforced"
    versioning {
      enabled = true
    }
  }
}