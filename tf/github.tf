resource "github_actions_secret" "base64-KUBE_CONFIG" {
  repository       = "devops-exercise"
  secret_name      = "base64-KUBE_CONFIG"
  plaintext_value  = linode_lke_cluster.this.kubeconfig
}

resource "github_actions_secret" "this" {
  repository       = "devops-exercise"
  secret_name      = "plain-KUBE_CONFIG"
  plaintext_value  = base64decode(linode_lke_cluster.this.kubeconfig)
}