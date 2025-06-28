resource "azurerm_public_ip" "pip" {
  name                = var.public_ip
  resource_group_name = var.resource_group
  location            = var.location
  allocation_method   = "Static"

}