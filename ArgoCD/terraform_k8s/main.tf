#---------------------------------------------------------------------
# TF main file for my PoC project
#
# Created by Vlad Patoka, who is looking for a job
#---------------------------------------------------------------------

data "google_client_config" "default" {
}

# Kubernetes Cluster
#
resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  initial_node_count = var.initial_node_count
  remove_default_node_pool = true
  deletion_protection = var.deletion_protection

  node_config {
    machine_type = var.node_machine_type
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  lifecycle {
    ignore_changes = all
  }

  network    = "default"
  subnetwork = "default"
}

resource "google_container_node_pool" "primary_nodes" {
  cluster    = google_container_cluster.primary.name
  location   = google_container_cluster.primary.location
  name       = "primary-node-pool"
  node_count = var.node_count

  lifecycle {
    ignore_changes = all
  }

  node_config {
    preemptible  = true
    machine_type = var.node_machine_type
    disk_size_gb = var.disk_size
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}
