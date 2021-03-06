variable "artifactory_license" {
}

variable "root_zone_name" {
}

variable "cluster" {
}

variable "namespace" {
}

variable "image_whitelist" {
}

variable "issuer_name" {}

variable "issuer_kind" {}

variable "elb_security_group_id" {
  default = ""
}

variable "grafeas_version" {
}

variable "enable_istio" {
  default = true
}

variable "enable_artifactory" {
  default = true
}

variable "enable_gitlab" {
  default = true
}

variable "enable_keycloak" {
  default = true
}

variable "enable_mailhog" {
  default = true
}

variable "enable_sonarqube" {
  default = true
}

variable "enable_xray" {
  default = true
}

variable "enable_grafeas" {
  default = true
}

variable "enable_harbor" {
  default = true
}

variable "crd_waiter" {
}

variable "enable_google_login" {}
variable "google_identity_provider_client_id" {}
variable "google_identity_provider_client_secret" {}
variable "enable_test_user" {}
variable "test_user_password" {}

variable "keycloak_admin_password" {
}

variable "keycloak_postgres_password" {
}

variable "smtp_host" {
}

variable "smtp_port" {
}

variable "smtp_username" {
}

variable "smtp_password" {
}

variable "smtp_from_email" {
}

variable "prometheus_slack_webhook_url" {
}

variable "prometheus_slack_channel" {
}

variable "harbor_registry_disk_size" {
  default = "200Gi"
}

variable "harbor_chartmuseum_disk_size" {
  default = "100Gi"
}

variable "k8s_storage_class" {}
