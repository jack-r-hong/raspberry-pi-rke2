
resource "kubectl_manifest" "IPAddressPool" {
  yaml_body = file("crds/iPAddressPool.yaml")
}

resource "kubectl_manifest" "L2Advertisement" {
  yaml_body = file("crds/L2Advertisement.yaml")
}


# resource "kubernetes_manifest" "L2Advertisement" {
#   manifest = {
#     apiVersion = "metallb.io/v1beta1"
#     kind       = "L2Advertisement"

#     metadata = {
#       name = "example"
#       namespace = "metallb-system"
#     }

#     spec = {
#         ipAddressPools = [
#             "first-pool"
#         ]

#     }
#   }
# }

