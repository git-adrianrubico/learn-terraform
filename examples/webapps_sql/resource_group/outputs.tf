output "resource_group_name" {
    value = azurerm_resource_group.resource_group.name
}

output "resource_group_location" {
  value = azurerm_resource_group.resource_group.location
}

output "resource_group_tag" {
  value = azurerm_resource_group.resource_group.tags
}