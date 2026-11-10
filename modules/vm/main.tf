resource "azurerm_public_ip" "vm" {
  name                = "pip-${var.name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}

resource "azurerm_network_interface" "vm" {
  name                = "nic-${var.name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm.id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                  = "vm-${var.name}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  size                  = var.size
  custom_data           = base64encode(file("${path.module}/cloud-init.yaml"))
  admin_username        = "jason"
  network_interface_ids = [azurerm_network_interface.vm.id]
  tags                  = var.tags

  admin_ssh_key {
    username   = "jason"
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }
}

resource "azurerm_dev_test_global_vm_shutdown_schedule" "vm" {
  virtual_machine_id    = azurerm_linux_virtual_machine.vm.id
  location              = var.location
  enabled               = true
  daily_recurrence_time = var.shutdown_time
  timezone              = "GMT Standard Time"
  tags                  = var.tags

  notification_settings {
    enabled = false
  }
}
