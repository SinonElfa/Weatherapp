provider "azurerm" {
  features {}
}
resource "azurerm_virtual_machine" "example" {
  name                  = "example-machine"
  location              = azurerm_resource_group.example.location
  resource_group_name   = azurerm_resource_group.example.name
  vm_size               = "Standard_F2"
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "20.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "Ubuntu"
    admin_username = "adminuser"
    admin_password = "P@ssw0rd!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = "production"
  }
}
