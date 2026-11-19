output "public_ip" {
  description = "The VM's public IP, or null when there's no VM."
  value       = one(module.vm[*].public_ip)
}

output "web_url" {
  description = "The nginx home page, or null when there's no VM."
  value       = var.create_vm ? "http://${one(module.vm[*].public_ip)}/" : null
}

output "key_vault_name_example" {
  description = "A name the Azure/naming module would give a Key Vault."
  value       = module.naming.key_vault.name_unique
}

output "vm_principal_id" {
  description = "The VM's managed identity, or null when there's no VM."
  value       = one(module.vm[*].principal_id)
}
