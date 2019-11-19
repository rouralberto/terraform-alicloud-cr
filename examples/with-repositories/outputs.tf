output "cr_access_key" {
  description = "The CR Namespace's User access key ID"
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
