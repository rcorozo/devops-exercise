resource "github_actions_secret" "example_secret" {
  repository       = "devops-exercise"
  secret_name      = "KUBE_CONFIG"
  plaintext_value  = base64decode(linode_lke_cluster.this.kubeconfig)
}