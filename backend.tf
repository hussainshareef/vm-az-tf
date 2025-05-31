terraform {
  backend "azurerm" {
    resource_group_name  = "Github-Selfhost-agent"
    storage_account_name = "backendterraformsf"
    container_name       = "backend"
    key                  = "my-infrastructure/terraform.tfstate"
  }
}