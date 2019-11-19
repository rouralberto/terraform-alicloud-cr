provider "alicloud" {}

locals {
  namespace = "my_cr_namespace"
  repositories = [
    "repo_one",
    "repo_two",
  ]
}

module "cr" {
  source  = "roura356a/cr/alicloud"
  version = "1.0.8"

  namespace    = local.namespace
  repositories = local.repositories
}
