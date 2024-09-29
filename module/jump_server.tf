resource "google_compute_instance" "jump-server" {
  name         = "jump-server"
  machine_type = "n2d-standard-8"
  zone         = var.jump-zone
  project = var.project

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20240808"
      size  = 30
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.public_subnet.name

    access_config {
      # Ephemeral public IP
    }
  }

  service_account {
    email  = google_service_account.jump_server_sa.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}