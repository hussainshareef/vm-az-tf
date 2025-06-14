resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_public_ip" "vm" {
  name                = "${var.vm_config.name}-pip"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Dynamic"
  tags                = var.vm_config.tags
}

resource "azurerm_network_interface" "vm" {
  name                = "${var.vm_config.name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.vm_config.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm.id
  }

  tags = var.vm_config.tags
}

resource "azurerm_windows_virtual_machine" "vm" {
  count = var.vm_config.os_type == "windows" ? 1 : 0

  name                = var.vm_config.name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_config.size
  admin_username      = var.vm_config.admin_username
  admin_password      = var.vm_config.admin_password
  network_interface_ids = [
    azurerm_network_interface.vm.id
  ]

  os_disk {
    name                 = "${var.vm_config.name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.vm_config.image_publisher
    offer     = var.vm_config.image_offer
    sku       = var.vm_config.image_sku
    version   = var.vm_config.image_version
  }

  tags = var.vm_config.tags
}

resource "azurerm_linux_virtual_machine" "vm" {
  count = var.vm_config.os_type == "linux" ? 1 : 0

  name                = var.vm_config.name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_config.size
  admin_username      = var.vm_config.admin_username
  network_interface_ids = [
    azurerm_network_interface.vm.id
  ]

  os_disk {
    name                 = "${var.vm_config.name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.vm_config.image_publisher
    offer     = var.vm_config.image_offer
    sku       = var.vm_config.image_sku
    version   = var.vm_config.image_version
  }

  dynamic "admin_ssh_key" {
    for_each = var.vm_config.ssh_public_key != null ? [1] : []
    content {
      username   = var.vm_config.admin_username
      public_key = var.vm_config.ssh_public_key
    }
  }

  tags = var.vm_config.tags
}
