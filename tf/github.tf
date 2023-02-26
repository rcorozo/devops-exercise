resource "github_actions_secret" "this" {
  repository       = "devops-exercise"
  secret_name      = "KUBE_CONFIG"
  plaintext_value  = linode_lke_cluster.this.kubeconfig
}