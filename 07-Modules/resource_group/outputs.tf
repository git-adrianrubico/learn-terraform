output "resouce_group_name" {
  value = azurerm_resource_group.rg-example.name
}

output "resource_group_location" {
  value = azurerm_resource_group.rg-example.location
}

output "resource_group_tag_env" {
  value = azurerm_resource_group.rg-example.tags
}