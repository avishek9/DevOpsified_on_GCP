resource "google_compute_network" "devopsified-vpc" {
  name    = "devopsified-vpc"
  project = var.project
}

resource "google_compute_subnetwork" "devopsified-public-subnet" {
  name          = "devopsified-public-subnet"
  ip_cidr_range = "10.4.0.0/24"
  region        = var.region
  network       = google_compute_network.devopsified-vpc.name
}

resource "google_compute_firewall" "ingress-tool-server" {
  name        = "ingress-tool-server"
  network     = google_compute_network.devopsified-vpc.name
  description = "Allowing Jenkins, Sonarqube, SSH Access"

  allow {
    protocol = "tcp"
    ports    = ["22", "8080", "9000", "9090", "80"]
  }

  source_ranges = ["0.0.0.0/0"]
}