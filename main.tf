module "resource_group" {
source = "../../child_modules/azurerm_resource_group"
  name     = var.name
  location =var.location
}