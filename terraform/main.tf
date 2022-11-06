terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.27.1"
    }
  }
}

provider "linode" {}

provider "local" {}

locals {
  // Decode the Kubeconfig so we can access the individual fields.
  kubeconfig = base64decode(linode_lke_cluster.bpiche-assessment.kubeconfig)
}

resource "linode_lke_cluster" "bpiche-assessment" {
    label       = "bpiche-assessment"
    k8s_version = "1.23"
    region      = "us-central"
    tags        = ["terraform"]

    pool {
        type  = "g6-standard-1"
        count = 3

        autoscaler {
          min = 3
          max = 5
        }
    }

    lifecycle {
        ignore_changes = [
            pool.0.count
        ]
    }
}

resource "local_file" "kubeconfig" {
  content  = local.kubeconfig
  filename = "kubeconfig.yaml"
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