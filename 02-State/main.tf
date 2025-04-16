resource "azurerm_resource_group" "example" {
  name     = "rg-example"
  location = var.azregion
  tags = {
    environment = local.env
  }
}