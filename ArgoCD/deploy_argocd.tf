provider "google" {
  project = var.project_id
  region  = var.region
}


# Kubernetes Cluster
#
module "k8s" {
  source              = "./terraform_k8s"
  project_id          = var.project_id
  region              = var.region
  cluster_name        = var.cluster_name
  initial_node_count  = var.initial_node_count
  node_count          = var.node_count
  node_machine_type   = var.node_machine_type
  disk_size           = var.disk_size
  deletion_protection = var.deletion_protection
}

provider "helm" {
  kubernetes {
    host                   = module.k8s.kubernetes_cluster_endpoint
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = module.k8s.kubernetes_cluster_ca_certificate
  }
  debug = "true"
}

provider "kubernetes" {
  #host                   = module.k8s.kubernetes_cluster_url
  #token                  = data.google_client_config.default.access_token
  #cluster_ca_certificate = module.k8s.kubernetes_cluster_ca_certificate
  #insecure_skip_verify   = true
}


data "google_client_config" "default" {
}

# ArgoCD deployment
# Can be deployed ONLY after cluster is ready
#
module "argocd" {
  source              = "./terraform_argocd"
  project_id          = var.project_id
  region              = var.region
  cluster_name        = var.cluster_name
  argocd_namespace    = var.argocd_namespace
  argo_chart_version  = var.argo_chart_version

  depends_on = [module.k8s]
}

# ArgoCD manifest deployemnt
# Can be deployed ONLY after ArgoCD deployment
#
module "argocd_root" {
  source             = "./terraform_argocd_root"
  cluster_name       = var.cluster_name
  git_source_path    = var.git_source_path
  git_source_repoURL = var.git_source_repoURL

  depends_on = [module.k8s, module.argocd]
}
