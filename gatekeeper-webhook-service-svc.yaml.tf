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
      "namespace" = kubernetes_manifest.namespace_gatekeeper_system.object.metadata.name
    }
    "spec" = {
      "ports" = [
        {
          "port" = 443
          "targetPort" = 8443
	  "protocol" = "TCP"
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
