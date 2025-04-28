# terraform {
#   backend "azurerm" {
#     storage_account_name = "devsteutest"
#     container_name       = "devcontainer"
#     key = "${terraform.workspace}/terraform.tfstate"
#   }
# }
