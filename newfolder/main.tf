resource "azurerm_resource_group" "testing" {
  name = "azurerm_rg"
  location = "central india"
  
}

resource "azurerm_storage_account" "testing-stg" {
  name = "jghosrh"
  location = "central india"
  resource_group_name = "azurerm-rg"
  account_replication_type = "GRS"
  account_tier = "Standard"
  
}