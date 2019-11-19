provider "alicloud" {}

locals {
  namespace = "my_cr_namespace"
  password = "my_password"
}

module "cr" {
  source  = "roura356a/cr/alicloud"
  version = "1.2.1"

  namespace = local.namespace
  password     = local.password
}
