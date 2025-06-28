# data "azurerm_subnet" "subnet" {
#   name                 = var.frontend_subnet
#   virtual_network_name = var.frontend_vnet
#   resource_group_name  = var.resource_group
# }

# data "azurerm_public_ip" "pip" {
#     name = var.pip_name
#     resource_group_name = var.resource_group
# }


resource "azurerm_network_interface" "nic" {
  name                = var.virtual_machine_nic_name
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    
    # public_ip_address_id = data.azurerm_public_ip.pip.id
    name                          = "testconfiguration1"
    subnet_id                     = "/subscriptions/9932c99c-ef31-4bee-b035-70dbddf5d26d/resourceGroups/frontend-rg/providers/Microsoft.Network/virtualNetworks/frontend-vnet/subnets/app-subnet"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                = var.frontend_vm
  resource_group_name = var.resource_group
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]
disable_password_authentication = false
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  custom_data = base64encode(<<EOF
#!/bin/bash
sudo apt update
sudo apt install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
EOF
  )


}
