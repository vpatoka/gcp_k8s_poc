#---------------------------------------------------------------------
# TF variable file for my PoC project
#
# Created by Vlad Patoka, who is looking for a job
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

variable "initial_node_count" {
  description = "The number of nodes in the GKE cluster"
  type        = number
}

variable "node_count" {
  description = "The number of nodes in the GKE cluster"
  type        = number
}

variable "node_machine_type" {
  description = "The machine type for the GKE cluster nodes"
  type        = string
}

variable "disk_size" {
  description = "Disk size for the cluster nodes"
  type        = number
}

variable "deletion_protection" {
  description = "Flag to allow to delete entire cluster using tf destroy command"
  type        = bool
}
