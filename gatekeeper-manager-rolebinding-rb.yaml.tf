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
      "namespace" = "gatekeeper-system"
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
        "namespace" = "gatekeeper-system"
      },
    ]
  }
}
