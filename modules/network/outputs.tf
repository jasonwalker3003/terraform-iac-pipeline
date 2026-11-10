output "subnet_id" {
  description = "The subnet VMs go in."
  value       = azurerm_subnet.vm.id
}
