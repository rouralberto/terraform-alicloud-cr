provider "alicloud" {
  version                 = ">=1.56.0"
  profile                 = var.profile
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "roura356a/cr"
}

resource "alicloud_cr_namespace" "registry_namespace" {
  name               = var.namespace
  auto_create        = var.repo_autocreate
  default_visibility = "PRIVATE"
}

resource "alicloud_cr_repo" "namespace_repositories" {
  count     = length(var.repositories)
  namespace = alicloud_cr_namespace.registry_namespace.name
  name      = element(var.repositories, count.index)
  summary   = "PRIVATE Docker Repository ${var.namespace}/${element(var.repositories, count.index)}"
  repo_type = "PRIVATE"
}

resource "alicloud_ram_policy" "cr_namespace_policy" {
  name = "${var.namespace}-cr-policy"
  document = jsonencode({
    "Statement" = [
      {
        "Action" = "cr:*",
        "Effect" = "Allow",
        "Resource" = [
          "acs:cr:*:*:repository/${var.namespace}",
          "acs:cr:*:*:repository/${var.namespace}/*"
        ]
      }
    ],
    "Version" = "1"
  })
  description = "RAM Policy with push/pull permissions for Container Registry's ${var.namespace} namespace"
  force       = true
}

resource "alicloud_ram_user" "namespace_user" {
  name         = "${var.namespace}-cr-user"
  display_name = "CR '${var.namespace}' Namespace User"
  comments     = "RAM User to use Container Registry's ${var.namespace} namespace"
  force        = true
}

resource "alicloud_ram_user_policy_attachment" "cr_user_policy_attachment" {
  policy_name = alicloud_ram_policy.cr_namespace_policy.name
  policy_type = alicloud_ram_policy.cr_namespace_policy.type
  user_name   = alicloud_ram_user.namespace_user.name
}

resource "alicloud_ram_access_key" "cr_ak" {
  user_name   = alicloud_ram_user.namespace_user.name
  secret_file = "cr-ak.json"
}
