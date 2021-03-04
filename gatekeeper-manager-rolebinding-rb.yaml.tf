resource "kubernetes_manifest" "rolebinding_gatekeeper_manager_rolebinding" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "RoleBinding"
    "metadata" = {
      "labels" = {
        "gatekeeper.sh/system" = "yes"
      }
      "name" = "gatekeeper-manager-rolebinding"
      "namespace" = kubernetes_manifest.namespace_gatekeeper_system.object.metadata.name
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind" = "Role"
      "name" = "gatekeeper-manager-role"
    }
    "subjects" = [
      {
        "kind" = "ServiceAccount"
        "name" = "gatekeeper-admin"
        "namespace" = kubernetes_manifest.namespace_gatekeeper_system.object.metadata.name
      },
    ]
  }
}
