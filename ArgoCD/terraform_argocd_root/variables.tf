variable "cluster_name" {
  description = "k8s cluster name to deploy ArgoCD ROOT Application"
  type        = string
}

variable "git_source_repoURL" {
  description = "GitSource repoURL to Track and deploy to k8s by ROOT Application"
  type        = string
}

variable "git_source_path" {
  description = "GitSource Path in Git Repository to Track and deploy to k8s by ROOT Application"
  type        = string
  default     = ""
}

variable "git_source_targetRevision" {
  description = "GitSource HEAD or Branch to Track and deploy to k8s by ROOT Application"
  type        = string
  default     = "HEAD"
}
