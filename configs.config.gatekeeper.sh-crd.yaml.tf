resource "kubernetes_manifest" "customresourcedefinition_configs_config_gatekeeper_sh" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "apiextensions.k8s.io/v1beta1"
    "kind" = "CustomResourceDefinition"
    "metadata" = {
      "annotations" = {
        "controller-gen.kubebuilder.io/version" = "v0.3.0"
      }
      "creationTimestamp" = null
      "labels" = {
        "gatekeeper.sh/system" = "yes"
      }
      "name" = "configs.config.gatekeeper.sh"
      "namespace" = "default"
    }
    "spec" = {
      "group" = "config.gatekeeper.sh"
      "names" = {
        "kind" = "Config"
        "listKind" = "ConfigList"
        "plural" = "configs"
        "singular" = "config"
      }
      "scope" = "Namespaced"
      "validation" = {
        "openAPIV3Schema" = {
          "description" = "Config is the Schema for the configs API"
          "properties" = {
            "apiVersion" = {
              "description" = "APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources"
              "type" = "string"
            }
            "kind" = {
              "description" = "Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds"
              "type" = "string"
            }
            "metadata" = {
              "type" = "object"
            }
            "spec" = {
              "description" = "ConfigSpec defines the desired state of Config"
              "properties" = {
                "match" = {
                  "description" = "Configuration for namespace exclusion"
                  "items" = {
                    "properties" = {
                      "excludedNamespaces" = {
                        "items" = {
                          "type" = "string"
                        }
                        "type" = "array"
                      }
                      "processes" = {
                        "items" = {
                          "type" = "string"
                        }
                        "type" = "array"
                      }
                    }
                    "type" = "object"
                  }
                  "type" = "array"
                }
                "readiness" = {
                  "description" = "Configuration for readiness tracker"
                  "properties" = {
                    "statsEnabled" = {
                      "type" = "boolean"
                    }
                  }
                  "type" = "object"
                }
                "sync" = {
                  "description" = "Configuration for syncing k8s objects"
                  "properties" = {
                    "syncOnly" = {
                      "description" = "If non-empty, only entries on this list will be replicated into OPA"
                      "items" = {
                        "properties" = {
                          "group" = {
                            "type" = "string"
                          }
                          "kind" = {
                            "type" = "string"
                          }
                          "version" = {
                            "type" = "string"
                          }
                        }
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                  }
                  "type" = "object"
                }
                "validation" = {
                  "description" = "Configuration for validation"
                  "properties" = {
                    "traces" = {
                      "description" = "List of requests to trace. Both \"user\" and \"kinds\" must be specified"
                      "items" = {
                        "properties" = {
                          "dump" = {
                            "description" = "Also dump the state of OPA with the trace. Set to `All` to dump everything."
                            "type" = "string"
                          }
                          "kind" = {
                            "description" = "Only trace requests of the following GroupVersionKind"
                            "properties" = {
                              "group" = {
                                "type" = "string"
                              }
                              "kind" = {
                                "type" = "string"
                              }
                              "version" = {
                                "type" = "string"
                              }
                            }
                            "type" = "object"
                          }
                          "user" = {
                            "description" = "Only trace requests from the specified user"
                            "type" = "string"
                          }
                        }
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                  }
                  "type" = "object"
                }
              }
              "type" = "object"
            }
            "status" = {
              "description" = "ConfigStatus defines the observed state of Config"
              "type" = "object"
            }
          }
          "type" = "object"
        }
      }
      "version" = "v1alpha1"
      "versions" = [
        {
          "name" = "v1alpha1"
          "served" = true
          "storage" = true
        },
      ]
    }
    "status" = {
      "acceptedNames" = {
        "kind" = ""
        "plural" = ""
      }
      "conditions" = []
      "storedVersions" = []
    }
  }
}
