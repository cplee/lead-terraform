data "helm_repository" "liatrio-flywheel" {
  count = var.enable_grafeas ? 1 : 0
  name  = "lead.prod.liatr.io"
  url   = "https://artifactory.toolchain.lead.prod.liatr.io/artifactory/helm/"
}

module "ca-issuer" {
  source = "../../common/ca-issuer"

  enabled          = var.enable_grafeas
  name             = "grafeas"
  namespace        = var.namespace
  common_name      = var.root_zone_name
  cert-manager-crd = var.crd_waiter
}

module "certificate" {
  source = "../../common/certificates"

  enabled         = var.enable_grafeas
  name            = "grafeas-cert"
  namespace       = var.namespace
  domain          = "grafeas-server"
  issuer_name     = module.ca-issuer.name
  certificate_crd = var.crd_waiter
  altname         = "localhost"
  wait_for_cert   = true
}

resource "helm_release" "grafeas" {
  name       = "grafeas-server"
  count      = var.enable_grafeas ? 1 : 0
  repository = data.helm_repository.liatrio-flywheel[0].metadata[0].name
  namespace  = var.namespace
  chart      = "grafeas-server"
  version    = var.grafeas_version
  timeout    = 300
  wait       = true

  depends_on = [
    module.certificate.cert_status,
  ]

  set {
    name  = "certificates.secretname"
    value = "${module.certificate.cert_name}-certificate"
  }

  set {
    name  = "grafeas_version"
    value = var.grafeas_version
  }
}
