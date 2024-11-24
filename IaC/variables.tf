#---------------------------------------------------------------------
# TF variable file for my PoC project
#
# Created by Vlad Patoka, who is looking for a job
#---------------------------------------------------------------------
variable "project_id" {
  description = "The GCP project ID"
  type        = string
  default     = "jobhunt-442620"
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
  default     = "us-central1"
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
  default     = "my-gke-cluster"
}

variable "initial_node_count" {
  description = "The number of nodes in the GKE cluster"
  type        = number
  default     = 1
}

variable "node_count" {
  description = "The number of nodes in the GKE cluster"
  type        = number
  default     = 2
}

variable "node_machine_type" {
  description = "The machine type for the GKE cluster nodes"
  type        = string
  default     = "e2-micro"
}

variable "disk_size" {
  description = "Disk size for the cluster nodes"
  type        = number
  default     = 20
}

variable "deletion_protection" {
  description = "Flag to allow to delete entire cluster using tf destroy command"
  type        = bool
  default     = false
}

variable "docker_repository" {
  description = "Docker Image Repo"
  type        = string
  default     = "my-app-repository"
}

variable "argocd_namespace" {
  description = "k8s namespace for ArgoCD"
  type        = string
  default     = "argocd"
}

variable "argo_chart_version" {
  description = "ArgoCD version"
  type        = string
  default     = "7.0.0"
}

