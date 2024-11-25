#---------------------------------------------------------------------
# TF main file for my PoC project
#
# Created by Vlad Patoka (who is looking for a job)
#---------------------------------------------------------------------

data "google_client_config" "default" {
}


resource "kubernetes_manifest" "argocd_root" {
  manifest = yamldecode(templatefile("${path.module}/root.yaml", {
    path           = var.git_source_path
    repoURL        = var.git_source_repoURL
    targetRevision = var.git_source_targetRevision
  }))
}
