terraform {
  backend "azurerm" {
    storage_account_name = "devstorageacct-eastus"
    container_name       = "devcontainer"
    key                  = "eastus/terraform.tfstate"
  }
}
