provider "alicloud" {}

locals {
  namespace = "my_cr_namespace"
}

module "cr" {
  source  = "roura356a/cr/alicloud"
  version = "1.2.2"

  namespace = local.namespace
}
