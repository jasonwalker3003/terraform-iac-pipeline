terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstatec22cecb3"
    container_name       = "tfstate"
    key                  = "terraform-iac-pipeline.tfstate"
    use_azuread_auth     = true
  }
}
