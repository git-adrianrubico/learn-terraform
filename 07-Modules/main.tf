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
  account_replication_type = "LRS"

  tags = {
    environment = local.env
  }
}