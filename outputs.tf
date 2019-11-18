output "namespace_id" {
  value = alicloud_cr_namespace.registry_namespace.id
}

output "ecr_user_id" {
  value = alicloud_ram_user.namespace_user.id
}

output "ecr_user_name" {
  value = alicloud_ram_user.namespace_user.name
}

output "ecr_user_key" {
  value = alicloud_ram_access_key.ecr_ak.id
}
