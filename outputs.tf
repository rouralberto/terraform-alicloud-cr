output "cr_namespace" {
  description = "The CR Namespace's ID"
  value       = alicloud_cr_namespace.registry_namespace.id
}

output "cr_access_key" {
  description = "The CR Namespace's Access Key"
  value       = alicloud_ram_access_key.cr_ak.id
}

output "cr_user" {
  description = "The CR Namespace's User"
  value       = alicloud_ram_login_profile.namespace_console_user.user_name
}

output "ram_console_username" {
  description = "Console login username"
  value       = "${alicloud_ram_login_profile.namespace_console_user.user_name}@${data.alicloud_account.current.id}.onaliyun.com"
}

output "cr_endpoint" {
  description = "Public endpoint of the registry"
  value       = alicloud_cr_repo.namespace_repositories.0.domain_list.public
}

output "repository_ids" {
  description = "List of repository IDs created"
  value       = alicloud_cr_repo.namespace_repositories.*.id
}

output "disposable_password" {
  description = "Password to activate the console login profile, forces to reset it"
  value       = random_string.cr_console_password.result
}

output "access_key_status" {
  description = "Status of the created AccessKey"
  value       = alicloud_ram_access_key.cr_ak
}
