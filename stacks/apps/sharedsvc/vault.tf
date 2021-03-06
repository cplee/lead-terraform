module "vault_namespace" {
  source      = "../../../modules/common/namespace"
  namespace   = "vault"
  annotations = {
    name    = "vault"
    cluster = var.eks_cluster_id
  }
}

module "vault" {
  source = "../../../modules/tools/vault"

  cert_crd_waiter           = module.cert_manager.crd_waiter
  cert_issuer_kind          = module.internal_services_cluster_issuer.issuer_kind
  cert_issuer_name          = module.internal_services_cluster_issuer.issuer_name
  namespace                 = module.vault_namespace.name
  region                    = var.region
  vault_hostname            = "vault.internal.services.liatr.io"
  vault_dynamodb_table_name = "vault.internal.services.liatr.io"
}
