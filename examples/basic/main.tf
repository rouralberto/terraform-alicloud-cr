provider "alicloud" {}

module "cr" {
  source  = "roura356a/cr/alicloud"
  version = "1.3.0"

  namespace    = "cr_repo_namespace"
  repositories = ["one", "two", "three"]
}
