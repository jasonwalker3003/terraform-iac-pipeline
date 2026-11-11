locals {
  tags = {
    env   = "lab"
    owner = "jason"
    week  = "06"
  }
}

data "azurerm_resource_group" "lab" {
  name = var.resource_group_name
}

module "network" {
  source = "./modules/network"

  name                = var.prefix
  resource_group_name = data.azurerm_resource_group.lab.name
  location            = data.azurerm_resource_group.lab.location
  address_space       = "10.50.0.0/16"
  my_ip               = var.my_ip
  tags                = local.tags
}

module "vm" {
  source = "./modules/vm"

  name                = var.prefix
  resource_group_name = data.azurerm_resource_group.lab.name
  location            = data.azurerm_resource_group.lab.location
  subnet_id           = module.network.subnet_id
  size                = var.vm_size
  ssh_public_key      = var.ssh_public_key
  tags                = local.tags
}

locals {
      oops = "badly indented"
}
