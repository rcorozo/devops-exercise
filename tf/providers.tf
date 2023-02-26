terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.27.1"
    }
    github = {
      source  = "integrations/github"
      version = "5.18.0"
    }
  }
}

provider "linode" {
  token = var.linode_token
}

provider "github" {
  token = var.github_token
}