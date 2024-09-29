resource "google_container_cluster" "gke_cluster" {
  name                     = var.cluster-name
  location                 = var.region
  initial_node_count       = 1
  remove_default_node_pool = true
  deletion_protection = false

  network    = google_compute_network.devopsified-gke-vpc.id
  subnetwork = google_compute_subnetwork.private_subnet.id

  release_channel {
    channel = "STABLE"
  }

  private_cluster_config {
    enable_private_endpoint = var.endpoint-private-access
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "pods-range"
    services_secondary_range_name = "services-range"
  }

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
    tags         = ["gke-cluster"]
    disk_size_gb  = 10
    labels = {
      env  = var.env
      name = var.cluster-name
    }
  }

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = google_compute_subnetwork.public_subnet.ip_cidr_range
      display_name = "Jump Server"
    }
  }
}

resource "google_container_node_pool" "gke_node_pool" {
  name     = "${var.cluster-name}-on-demand-nodes"
  cluster  = google_container_cluster.gke_cluster.name
  location = google_container_cluster.gke_cluster.location

  node_count = var.desired_capacity_on_demand

  autoscaling {
    min_node_count = var.min_capacity_on_demand
    max_node_count = var.max_capacity_on_demand
  }

  node_config {
    machine_type = var.ondemand_instance_types
    disk_size_gb = 70

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]

    labels = {
      type = "ondemand"
    }
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}

resource "google_container_node_pool" "spot_node_pool" {
  name     = "${var.cluster-name}-spot-nodes"
  cluster  = google_container_cluster.gke_cluster.name
  location = google_container_cluster.gke_cluster.location

  node_count = var.desired_capacity_spot

  autoscaling {
    min_node_count = var.min_capacity_spot
    max_node_count = var.max_capacity_spot
  }

  node_config {
    preemptible  = true
    machine_type = var.spot_instance_types
    disk_size_gb = 70

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]

    labels = {
      type      = "spot"
      lifecycle = "spot"
    }
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}
