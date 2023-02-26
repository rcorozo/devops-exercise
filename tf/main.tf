locals {
  // Decode the Kubeconfig so we can access the individual fields.
  kubeconfig = base64decode(linode_lke_cluster.this.kubeconfig)
}

resource "linode_lke_cluster" "this" {
  label       = var.cluster_label
  k8s_version = var.k8s_version
  region      = var.cluster_region
  tags        = ["terraform"]

  pool {
    type  = var.cluster_node_type
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