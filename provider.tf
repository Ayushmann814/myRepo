terraform {
  required_providers {
    azurerm = {
        source = "/hashicorp/azurerm"
        version = "4.37.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "frontend-rg-prod"
    storage_account_name = "backendtfstate"
    container_name = "tfstate"
    key = "prod.tfstate"
    
  }
}