resource "azurerm_resource_group" "resource_group" {
  name     = var.name
  location = var.azregion

    tags = {
    environment = local.env
  }
}