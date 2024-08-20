resource "google_compute_instance" "tool-server" {
  name         = "tool-server"
  machine_type = "n2-standard-8"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/debian-12-bookworm-v20240815"
      size  = 30
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.devopsified-public-subnet.name

    access_config {
      # Ephemeral public IP
    }
  }

  metadata_startup_script = file("tools-install.sh")

  service_account {
    email  = google_service_account.tool-machine-sa.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}