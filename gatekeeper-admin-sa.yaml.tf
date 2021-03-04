resource "kubernetes_manifest" "serviceaccount_gatekeeper_admin" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "v1"
    "kind" = "ServiceAccount"
    "metadata" = {
      "labels" = {
        "gatekeeper.sh/system" = "yes"
      }
      "name" = "gatekeeper-admin"
      "namespace" = "gatekeeper-system"
    }
  }
}