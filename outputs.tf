output "cr_access_key" {
  description = "The CR Namespace's Access Key"
  value       = alicloud_ram_access_key.cr_ak.id
}

output "cr_endpoint" {
  description = "Public endpoint of the registry"
  value       = alicloud_cr_repo.namespace_repositories[0].domain_list.public
}

output "repository_ids" {
  description = "List of repository IDs created"
  value       = alicloud_cr_repo.namespace_repositories.*.id
}
