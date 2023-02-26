resource "kubernetes_namespace" "this" {
  metadata {
    name = "my-first-namespace"
  }
}