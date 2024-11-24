#---------------------------------------------------------------------
# TF main file for my PoC project
#
# Created by Vlad Patoka, who is looking for a job
#---------------------------------------------------------------------
provider "google" {
  project = var.project_id
  region  = var.region
}

data "google_client_config" "default" {
}

provider "kubernetes" {
  host                   = google_container_cluster.primary.endpoint
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = google_container_cluster.primary.endpoint
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)
  }
  debug = "true"
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

# ArgoCD
# 
# Can be deployed ONLY after k8s cluster deployment
resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm" # Official Chart Repo
  chart            = "argo-cd"                              # Official Chart Name
  namespace        = var.argocd_namespace
  version          = var.argo_chart_version
  create_namespace = true
  values           = [file("argocd.yaml")]

  #set {
  #  name  = "server.service.type"
  #  value = "LoadBalancer"
  #}

  depends_on = [google_container_cluster.primary, google_container_node_pool.primary_nodes]
}
