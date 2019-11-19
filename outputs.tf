output "ecr_user_id" {
  description = "The ECR Namespace's User ID"
  value       = alicloud_ram_user.namespace_user.id
}

output "ecr_user_name" {
  description = "The ECR Namespace's User Name"
  value       = alicloud_ram_user.namespace_user.name
}

output "ecr_user_key" {
  description = "The ECR Namespace's User access key ID"
  value       = alicloud_ram_access_key.ecr_ak.id
}
