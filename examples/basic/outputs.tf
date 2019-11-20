output "cr_namespace" {
  description = "The CR Namespace's ID"
  value       = module.cr.cr_namespace
}

output "cr_access_key" {
  description = "The CR Namespace's Access Key"
  value       = module.cr.cr_access_key
}

output "cr_user" {
  description = "The CR Namespace's User"
  value       = module.cr.cr_user
}

output "ram_console_username" {
  description = "Console login username"
  value       = module.cr.ram_console_username
}

output "cr_endpoint" {
  description = "Public endpoint of the registry"
  value       = module.cr.cr_endpoint
}

output "repository_ids" {
  description = "List of repository IDs created"
  value       = module.cr.repository_ids
}

output "disposable_password" {
  description = "Password to activate the console login profile, forces to reset it"
  value       = module.cr.disposable_password
}

output "access_key_status" {
  description = "Status of the created AccessKey"
  value       = module.cr.access_key_status
}
