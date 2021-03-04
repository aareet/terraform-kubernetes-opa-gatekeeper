resource "kubernetes_manifest" "role_gatekeeper_manager_role" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind"       = "Role"
    "metadata" = {

      "labels" = {
        "gatekeeper.sh/system" = "yes"
      }
      "name"      = "gatekeeper-manager-role"
      "namespace" = kubernetes_manifest.namespace_gatekeeper_system.object.metadata.name
    }
    "rules" = [
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "events",
        ]
        "verbs" = [
          "create",
          "patch",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "secrets",
        ]
        "verbs" = [
          "create",
          "delete",
          "get",
          "list",
          "patch",
          "update",
          "watch",
        ]
      },
    ]
  }
}
