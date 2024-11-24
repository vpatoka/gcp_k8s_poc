# My GCP Kubernetes Project

I was creating this project during my job hunt for the new opportunities.
So, please give me a chance: https://www.linkedin.com/in/vpatoka/

This repository contains scripts, infrastructure as code (IaC), and Helm charts to deploy a Kubernetes cluster on Google Cloud Platform (GCP) and a simple web application with Horizontal Pod Autoscaler (HPA) autoscaling.

## Repository Structure

- **Scripts**: Shell scripts to install Helm and get GCP credentials.
- **IaC**: Terraform code to build a Kubernetes cluster on GCP.
- **App-HelmPOC**: Helm chart and templates to deploy a simple web application with HPA autoscaling.

## Prerequisites

- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- [Terraform](https://www.terraform.io/downloads.html)
- [Helm](https://helm.sh/docs/intro/install/)

## Getting Started

### 1. Install Helm and Get GCP Credentials

Navigate to the `Scripts` directory and run the shell scripts to install Helm and get GCP credentials.

```sh
cd Scripts
./get-gcp-credentials
./sudo apt-get install google-cloud-cli-gke-gcloud-auth-plugin
./install-helm.sh

### 2. Build Kubernetes Cluster with Terraform
Navigate to the IaC directory and apply the Terraform configuration to build the Kubernetes cluster.

```sh
cd ../IaC
terraform init
terraform apply

### 3. Deploy Web Application with Helm
Navigate to the root directory and use Helm to deploy the web application with HPA autoscaling.

```sh
cd ../
helm install my-web-app ./App-HelmPoC/

Directory Details

Scripts
install-helm.sh: Script to install Helm.
get-gcp-credentials.sh: Script to authenticate and get GCP credentials.

IaC
main.tf: Terraform configuration to build a Kubernetes cluster on GCP.
variables.tf: Terraform variables file.
output.tf: Show some output values from TF

App-HelmPOC
Chart.yaml: Helm chart metadata.
values.yaml: Default configuration values for the Helm chart.
templates/: Directory containing Kubernetes resource templates.

Contributing
Contributions are welcome! Please open an issue or submit a pull request.

License
This project is licensed under the MIT License. See the LICENSE file for details.
