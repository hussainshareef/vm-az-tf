terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-backend-rg"
    storage_account_name = "tfstate12345"
    container_name       = "tfstate"
    key                  = "my-infrastructure/terraform.tfstate"
  }
}