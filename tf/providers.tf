terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.27.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.18.1"
    }
  }
}

provider "linode" {
  token = var.linode_token
}

provider "kubernetes" {
  config_path = local_file.kubeconfig
}

provider "local" {}