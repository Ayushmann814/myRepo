data "azurerm_public_ip" "public_ip" {
  name                = var.lb_public_ip
  resource_group_name = var.resource_group
}


resource "azurerm_lb" "LB" {
  name                = var.load_balancer
  location            = var.location
  resource_group_name = var.resource_group

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = data.azurerm_public_ip.public_ip.id
  }
}