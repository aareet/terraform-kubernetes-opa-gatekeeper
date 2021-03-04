resource "kubernetes_manifest" "namespace_gatekeeper_system" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "v1"
    "kind"       = "Namespace"
    "metadata" = {
      "labels" = {
        "admission.gatekeeper.sh/ignore" = "no-self-managing"
        "control-plane"                  = "controller-manager"
        "gatekeeper.sh/system"           = "yes"
      }
      "name" = "gatekeeper-system"
    }
  }
}
