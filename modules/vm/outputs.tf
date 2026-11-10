output "public_ip" {
  description = "The VM's public IP."
  value       = azurerm_public_ip.vm.ip_address
}
