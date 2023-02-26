resource "kubernetes_namespace" "this" {
  metadata {
    name = "my-first-namespace"
  }

  depends_on = [
    local_file.kubeconfig
  ]
}