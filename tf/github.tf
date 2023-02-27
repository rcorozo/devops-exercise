resource "github_actions_secret" "base64-KUBE_CONFIG" {
  repository       = "devops-exercise"
  secret_name      = "base64_KUBE_CONFIG"
  plaintext_value  = linode_lke_cluster.this.kubeconfig
}

resource "github_actions_secret" "plain-KUBE_CONFIG" {
  repository       = "devops-exercise"
  secret_name      = "plain_KUBE_CONFIG"
  plaintext_value  = base64decode(linode_lke_cluster.this.kubeconfig)
}