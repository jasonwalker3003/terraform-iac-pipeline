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
