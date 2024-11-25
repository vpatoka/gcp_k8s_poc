#---------------------------------------------------------------------
# TF main file for my PoC project
#
# Created by Vlad Patoka (who is looking for a job)
#---------------------------------------------------------------------

data "google_client_config" "default" {
}

# ArgoCD
# Can be deployed ONLY after k8s cluster deployment
#
resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm" # Official Chart Repo
  chart            = "argo-cd"                              # Official Chart Name
  namespace        = var.argocd_namespace
  version          = var.argo_chart_version
  create_namespace = true
  values           = [file("${path.module}/argocd.yaml")]
  timeout          = "3600" # changed from 1200

  #set {
  #  name  = "server.service.type"
  #  value = "LoadBalancer"
  #}
}
