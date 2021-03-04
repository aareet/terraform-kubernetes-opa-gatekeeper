resource "kubernetes_manifest" "secret_gatekeeper_webhook_server_cert" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "v1"
    "kind" = "Secret"
    "metadata" = {
      "labels" = {
        "gatekeeper.sh/system" = "yes"
      }
      "name" = "gatekeeper-webhook-server-cert"
      "namespace" = "gatekeeper-system"
    }
  }
}
