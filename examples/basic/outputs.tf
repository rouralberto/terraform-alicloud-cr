output "cr_user_id" {
  description = "The CR Namespace's User ID"
  value       = module.cr.cr_user_id
}

output "cr_user_name" {
  description = "The CR Namespace's User Name"
  value       = module.cr.cr_user_name
}

output "cr_user_key" {
  description = "The CR Namespace's User access key ID"
  value       = module.cr.cr_user_key
}
