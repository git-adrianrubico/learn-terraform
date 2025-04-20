resource "azurerm_resource_group" "rg-example" {
  name     = "rg-example"
  location = var.azregion
  tags = {
    environment = local.env
  }
}


resource "azurerm_storage_account" "sa-example" {
  name                     = "stgacsample${local.env}01"
  resource_group_name      = azurerm_resource_group.rg-example.name
  location                 = azurerm_resource_group.rg-example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    environment = local.env
  }
}

resource "azurerm_linux_virtual_machine" "vm-example" {
  name                            = var.azvm
  resource_group_name             = azurerm_resource_group.rg-example.name
  location                        = azurerm_resource_group.rg-example.location
  zone                            = "2"
  size                            = "Standard_B1s"
  admin_username                  = "adminuser"
  admin_password                  = "P@ssw0rd123456!"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic-example.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }

  tags = {
    environment = local.env
  }
}

resource "azurerm_virtual_network" "vnet-example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg-example.location
  resource_group_name = azurerm_resource_group.rg-example.name
}

resource "azurerm_subnet" "subnet-example" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.rg-example.name
  virtual_network_name = azurerm_virtual_network.vnet-example.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "nic-example" {
  name                = "example-nic"
  location            = azurerm_resource_group.rg-example.location
  resource_group_name = azurerm_resource_group.rg-example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet-example.id
    private_ip_address_allocation = "Dynamic"
  }
}