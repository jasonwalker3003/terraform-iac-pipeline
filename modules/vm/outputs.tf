output "public_ip" {
  description = "The VM's public IP."
  value       = azurerm_public_ip.vm.ip_address
}

output "principal_id" {
  description = "The VM's managed identity."
  value       = azurerm_linux_virtual_machine.vm.identity[0].principal_id
}
