resource "azurerm_virtual_network" "virtual_network" {
    name = var.virtual_network_name
    location = var.virtual_network_location
    resource_group_name = var.resource_group
    address_space = ["10.0.0.0/16"]
}


virtual_network_name = "frontend-rg-01"
virtual_network_location = "central india"
resource_group = "frontend-rg"
