output "rg_name" {
  value = azurerm_resource_group.rg-hcl-example.name
}

output "sa_name" {
  value = azurerm_storage_account.sa-example.name
}