resource "kubernetes_manifest" "service_gatekeeper_webhook_service" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "labels" = {
        "gatekeeper.sh/system" = "yes"
      }
      "name" = "gatekeeper-webhook-service"
      "namespace" = "gatekeeper-system"
    }
    "spec" = {
      "ports" = [
        {
          "port" = 443
          "targetPort" = 8443
        },
      ]
      "selector" = {
        "control-plane" = "controller-manager"
        "gatekeeper.sh/operation" = "webhook"
        "gatekeeper.sh/system" = "yes"
      }
    }
  }
}
