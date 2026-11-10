moved {
  from = azurerm_virtual_network.lab
  to   = module.network.azurerm_virtual_network.this
}

moved {
  from = azurerm_subnet.vm
  to   = module.network.azurerm_subnet.vm
}

moved {
  from = azurerm_network_security_group.vm
  to   = module.network.azurerm_network_security_group.vm
}

moved {
  from = azurerm_subnet_network_security_group_association.vm
  to   = module.network.azurerm_subnet_network_security_group_association.vm
}

moved {
  from = azurerm_public_ip.vm
  to   = module.vm.azurerm_public_ip.vm
}

moved {
  from = azurerm_network_interface.vm
  to   = module.vm.azurerm_network_interface.vm
}

moved {
  from = azurerm_linux_virtual_machine.vm
  to   = module.vm.azurerm_linux_virtual_machine.vm
}

moved {
  from = azurerm_dev_test_global_vm_shutdown_schedule.vm
  to   = module.vm.azurerm_dev_test_global_vm_shutdown_schedule.vm
}
