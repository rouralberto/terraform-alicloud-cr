provider "alicloud" {}

locals {
  namespace = "my_cr_namespace"
}

module "cr" {
  source  = "roura356a/cr/alicloud"
  version = "1.1.1"

  namespace = local.namespace
}
