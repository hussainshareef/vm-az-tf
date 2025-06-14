terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tf-state"
    storage_account_name = "tfstatergstorageaccount"
    container_name       = "backend"
    key                  = "my-infrastructure/terraform.tfstate"
  }
}
