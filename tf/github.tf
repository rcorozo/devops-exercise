resource "github_actions_secret" "this" {
  repository       = "devops-exercise"
  secret_name      = "KUBE_CONFIG"
  encrypted_value  = linode_lke_cluster.this.kubeconfig
}