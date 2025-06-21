resource "azurerm_resource_group" "rg-example" {
  name     = "rg-example"
  location = var.azregion
  tags = {
    environment = local.env
  }
}