resource "github_actions_secret" "this" {
  repository       = "devops-exercise"
  secret_name      = "KUBE_CONFIG"
  plaintext_value  = base64decode(linode_lke_cluster.this.kubeconfig)
}