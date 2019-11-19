output "cr_user_id" {
  description = "The CR Namespace's User ID"
  value       = alicloud_ram_user.namespace_user.id
}

output "cr_user_name" {
  description = "The CR Namespace's User Name"
  value       = alicloud_ram_user.namespace_user.name
}

output "cr_user_key" {
  description = "The CR Namespace's User access key ID"
  value       = alicloud_ram_access_key.cr_ak.id
}
