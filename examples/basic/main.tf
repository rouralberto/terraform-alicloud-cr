provider "alicloud" {}

locals {
  namespace    = "my_cr_namespace"
  repositories = ["one", "two", "three"]
}

module "cr" {
  source  = "roura356a/cr/alicloud"
  version = "1.3.0"

  namespace    = local.namespace
  repositories = local.repositories
}
