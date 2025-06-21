resource "azurerm_resource_group" "rg-example" {
  name     = var.rgname
  location = var.azregion
  tags = {
    environment = local.env
  }
}