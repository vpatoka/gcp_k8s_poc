# Module to deploy ArgoCD ROOT Applicaiton to k8s

Example to use:

```
module "argocd_root" {
  source             = "./terraform_argocd_root"
  cluster_name       = "my-gke-cluster"
  git_source_path    = "app_deployment/applications"
  git_source_repoURL = "git@github.com:vpatoka/gcp_k8s_poc.git"
}
```
