output "rg_name" {
  value = azurerm_resource_group.rg-example.name
}

output "sa_name" {
  value = azurerm_storage_account.sa-example.name
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.vm-example.name
}