locals {
  cluster-name = var.cluster-name
}

resource "google_compute_network" "devopsified-gke-vpc" {
  name = var.vpc-name
}

resource "google_compute_subnetwork" "public_subnet" {
  name                     = var.pub-sub-name
  ip_cidr_range            = var.pub-cidr-block
  region                   = var.region
  network                  = google_compute_network.devopsified-gke-vpc.name
}

resource "google_compute_subnetwork" "private_subnet" {
  name                     = var.pri-sub-name
  ip_cidr_range            = var.pri-cidr-block
  region                   = var.region
  network                  = google_compute_network.devopsified-gke-vpc.name
  private_ip_google_access = true # Enable Private Google Access

    # Secondary ranges for pods and services (required)
  secondary_ip_range {
    range_name    = "pods-range"
    ip_cidr_range = var.sec-pod-cidr-block
  }

  secondary_ip_range {
    range_name    = "services-range"
    ip_cidr_range = var.sec-service-cidr-block
  }
}

resource "google_compute_address" "static_ip" {
  name = var.static-ip-name
  region = var.region
}

resource "google_compute_router" "devopsified_cloud_router" {
  name    = var.router-name
  region  = var.region
  network = google_compute_network.devopsified-gke-vpc.name
}

# Create a Cloud NAT for outbound internet access
resource "google_compute_router_nat" "devopsified_cloud_nat" {
  name   = var.cloud-nat-name
  region = var.region
  router = google_compute_router.devopsified_cloud_router.name

  nat_ips                = [google_compute_address.static_ip.name]  # Optional: assign a static IP

  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

resource "google_compute_firewall" "gke-cluster-ingress-fw-rule" {
  name    = var.gke-ingress-fw-rule
  network = google_compute_network.devopsified-gke-vpc.name
  description = "Allowing 443 from jump server only"

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]
}
resource "google_compute_firewall" "gke-cluster-egress-fw-rule" {
  name    = var.gke-egress-fw-rule
  network = google_compute_network.devopsified-gke-vpc.name
  direction = "EGRESS"
  allow{
    protocol           = "all"
  }
  destination_ranges = ["0.0.0.0/0"]
}