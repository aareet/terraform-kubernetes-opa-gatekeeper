resource "kubernetes_manifest" "customresourcedefinition_constraintpodstatuses_status_gatekeeper_sh" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "apiextensions.k8s.io/v1beta1"
    "kind"       = "CustomResourceDefinition"
    "metadata" = {
      "annotations" = {
        "controller-gen.kubebuilder.io/version" = "v0.3.0"
      }

      "labels" = {
        "gatekeeper.sh/system" = "yes"
      }
      "name" = "constraintpodstatuses.status.gatekeeper.sh"
    }
    "spec" = {
      "group" = "status.gatekeeper.sh"
      "names" = {
        "kind"     = "ConstraintPodStatus"
        "listKind" = "ConstraintPodStatusList"
        "plural"   = "constraintpodstatuses"
        "singular" = "constraintpodstatus"
      }
      "scope" = "Namespaced"
      "validation" = {
        "openAPIV3Schema" = {
          "description" = "ConstraintPodStatus is the Schema for the constraintpodstatuses API"
          "properties" = {
            "apiVersion" = {
              "description" = "APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources"
              "type"        = "string"
            }
            "kind" = {
              "description" = "Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds"
              "type"        = "string"
            }
            "metadata" = {
              "type" = "object"
            }
            "status" = {
              "description" = "ConstraintPodStatusStatus defines the observed state of ConstraintPodStatus"
              "properties" = {
                "constraintUID" = {
                  "description" = "Storing the constraint UID allows us to detect drift, such as when a constraint has been recreated after its CRD was deleted out from under it, interrupting the watch"
                  "type"        = "string"
                }
                "enforced" = {
                  "type" = "boolean"
                }
                "errors" = {
                  "items" = {
                    "description" = "Error represents a single error caught while adding a constraint to OPA"
                    "properties" = {
                      "code" = {
                        "type" = "string"
                      }
                      "location" = {
                        "type" = "string"
                      }
                      "message" = {
                        "type" = "string"
                      }
                    }
                    "required" = [
                      "code",
                      "message",
                    ]
                    "type" = "object"
                  }
                  "type" = "array"
                }
                "id" = {
                  "type" = "string"
                }
                "observedGeneration" = {
                  "format" = "int64"
                  "type"   = "integer"
                }
                "operations" = {
                  "items" = {
                    "type" = "string"
                  }
                  "type" = "array"
                }
              }
              "type" = "object"
            }
          }
          "type" = "object"
        }
      }
      "version" = "v1beta1"
      "versions" = [
        {
          "name"    = "v1beta1"
          "served"  = true
          "storage" = true
        },
      ]
    }
  }
}
