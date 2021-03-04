resource "kubernetes_manifest" "validatingwebhookconfiguration_gatekeeper_validating_webhook_configuration" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "admissionregistration.k8s.io/v1beta1"
    "kind"       = "ValidatingWebhookConfiguration"
    "metadata" = {

      "labels" = {
        "gatekeeper.sh/system" = "yes"
      }
      "name" = "gatekeeper-validating-webhook-configuration"
    }
    "webhooks" = [
      {
        "clientConfig" = {
          "caBundle" = "Cg=="
          "service" = {
            "name"      = "gatekeeper-webhook-service"
            "namespace" = kubernetes_manifest.namespace_gatekeeper_system.object.metadata.name
            "path"      = "/v1/admit"
          }
        }
        "failurePolicy" = "Ignore"
        "name"          = "validation.gatekeeper.sh"
        "namespaceSelector" = {
          "matchExpressions" = [
            {
              "key"      = "admission.gatekeeper.sh/ignore"
              "operator" = "DoesNotExist"
            },
          ]
        }
        "rules" = [
          {
            "apiGroups" = [
              "*",
            ]
            "apiVersions" = [
              "*",
            ]
            "operations" = [
              "CREATE",
              "UPDATE",
            ]
            "resources" = [
              "*",
            ]
          },
        ]
        "sideEffects"    = "None"
        "timeoutSeconds" = 3
      },
      {
        "clientConfig" = {
          "caBundle" = "Cg=="
          "service" = {
            "name"      = "gatekeeper-webhook-service"
            "namespace" = kubernetes_manifest.namespace_gatekeeper_system.object.metadata.name
            "path"      = "/v1/admitlabel"
          }
        }
        "failurePolicy" = "Fail"
        "name"          = "check-ignore-label.gatekeeper.sh"
        "rules" = [
          {
            "apiGroups" = [
              "",
            ]
            "apiVersions" = [
              "*",
            ]
            "operations" = [
              "CREATE",
              "UPDATE",
            ]
            "resources" = [
              "namespaces",
            ]
          },
        ]
        "sideEffects"    = "None"
        "timeoutSeconds" = 3
      },
    ]
  }
}
