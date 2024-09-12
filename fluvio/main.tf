# resource "kubernetes_namespace" "fluvio_sys_ns" {
#   metadata {
#     name = "fluvio-sys"
#   }
# }

resource "kubernetes_namespace" "fluvio_ns" {
  metadata {
    name = "fluvio"
  }
}

# resource "helm_release" "fluvio-crds" {
#   name  = "fluvio"
#   namespace = "fluvio-sys"
#   chart = "./helm/fluvio-sys"

#   depends_on = [kubernetes_namespace.fluvio_sys_ns]
# }

resource "helm_release" "fluvio-app" {
  name  = "fluvio-app"
  namespace = "fluvio"
  chart = "./helm/fluvio-app"

  values = [
    file("${path.module}/values.yaml")
  ]

  depends_on = [kubernetes_namespace.fluvio_ns
  # helm_release.fluvio-crds
  ]
}

resource "kubectl_manifest" "HTTPRoute" {
  yaml_body  = file("./httproute.yaml")
}

resource "kubectl_manifest" "ReferenceGrant" {
  yaml_body  = file("./routegf.yaml")
}


# resource "time_sleep" "wait_30_seconds" {
#   depends_on = [kubernetes_namespace.envoy-gateway-system]

#   destroy_duration = "30s"
# }