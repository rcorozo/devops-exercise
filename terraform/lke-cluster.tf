terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.27.1"
    }
  }
}

provider "linode" {
}

resource "linode_lke_cluster" "bpiche-assessment" {
    label       = "bpiche-assessment"
    k8s_version = "1.23"
    region      = "us-central"
    tags        = ["terraform"]

    pool {
        type  = "g6-standard-2"
        count = 3
    }
}

output "kubeconfig" {
   value = linode_lke_cluster.bpiche-assessment.kubeconfig
   sensitive = true
}

output "api_endpoints" {
   value = linode_lke_cluster.bpiche-assessment.api_endpoints
}

output "status" {
   value = linode_lke_cluster.bpiche-assessment.status
}

output "id" {
   value = linode_lke_cluster.bpiche-assessment.id
}