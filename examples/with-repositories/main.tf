provider "alicloud" {}

locals {
  namespace = "my_cr_namespace"
  password = "my_password"
  repositories = [
    "repo_one",
    "repo_two",
  ]
}

module "cr" {
  source  = "roura356a/cr/alicloud"
  version = "1.2.1"

  namespace    = local.namespace
  password     = local.password
  repositories = local.repositories
}
