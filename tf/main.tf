resource "linode_lke_cluster" "this" {
  label       = var.cluster_label
  k8s_version = var.k8s_version
  region      = var.cluster_region
  tags        = ["terraform"]

  pool {
    type  = var.cluster_node_type
    count = 1

    autoscaler {
      min = 1
      max = 2
    }
  }

  lifecycle {
    ignore_changes = [
      pool.0.count
    ]
  }
}