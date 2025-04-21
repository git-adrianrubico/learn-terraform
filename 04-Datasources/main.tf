resource "azurerm_storage_account" "sa-example" {
  name                     = "stgacsample-dev01"
  resource_group_name      = azurerm_resource_group.rg-example.name
  location                 = azurerm_resource_group.rg-example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    environment = "dev"
  }
}