output "api_endpoints" {
  value = linode_lke_cluster.this.api_endpoints
}

output "kubeconfig" {
    value     = nonsensitive(local_file.kubeconfig.content)
}