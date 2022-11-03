terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.27.1"
    }
  }
}

provider "linode" {
  # token = "YOUR_LINODE_API_TOKEN"
}

resource "linode_lke_cluster" "my-cluster" {
    label       = "my-cluster"
    k8s_version = "1.23"
    region      = "us-central"
    tags        = ["terraform"]

    pool {
        type  = "g6-standard-2"
        count = 3
    }
}
