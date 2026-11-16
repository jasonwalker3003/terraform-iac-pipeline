locals {
  tags = {
    env   = var.environment
    owner = "jason"
    week  = "07"
  }
}

data "azurerm_resource_group" "lab" {
  name = var.resource_group_name
}

module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.4.4"
  suffix  = [var.prefix]
}

module "network" {
  source = "./modules/network"

  name                = var.prefix
  resource_group_name = data.azurerm_resource_group.lab.name
  location            = data.azurerm_resource_group.lab.location
  address_space       = var.address_space
  my_ip               = var.my_ip
  tags                = local.tags
}

module "vm" {
  source = "./modules/vm"
  count  = var.create_vm ? 1 : 0

  name                = var.prefix
  resource_group_name = data.azurerm_resource_group.lab.name
  location            = data.azurerm_resource_group.lab.location
  subnet_id           = module.network.subnet_id
  size                = var.vm_size
  ssh_public_key      = var.ssh_public_key
  tags                = local.tags
}
