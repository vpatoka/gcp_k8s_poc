#---------------------------------------------------------------------
# TF variable file for my PoC project
#
# Created by Vlad Patoka (who is looking for a job)
#---------------------------------------------------------------------
variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "argocd_namespace" {
  description = "k8s namespace for ArgoCD"
  type        = string
}

variable "argo_chart_version" {
  description = "Helm Chart Version of ArgoCD: https://github.com/argoproj/argo-helm/releases"
  type        = string
}
