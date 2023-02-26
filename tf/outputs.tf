output "api_endpoints" {
  value = linode_lke_cluster.this.api_endpoints
}

output "kubeconfig" {
  value     = nonsensitive(linode_lke_cluster.this.kubeconfig)
  # sensitive = true
}