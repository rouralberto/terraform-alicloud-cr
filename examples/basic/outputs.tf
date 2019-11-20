output "cr_access_key" {
  description = "The CR Namespace's Access Key"
  value       = module.cr.cr_access_key
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
