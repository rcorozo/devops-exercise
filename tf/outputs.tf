output "api_endpoints" {
  value = linode_lke_cluster.this.api_endpoints
}

output "kubeconfig" {
    value = base64decode(nonsensitive(linode_lke_cluster.this.kubeconfig))
}