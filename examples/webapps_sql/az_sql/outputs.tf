output "sql_server_fqdn" {
  value = azurerm_mssql_server.sql.fully_qualified_domain_name
}

output "sql_server_name" {
  value = azurerm_mssql_server.sql.name
}

output "sql_db_name" {
  value = azurerm_mssql_database.db.name
}

output "sql_admin_username" {
  value = azurerm_mssql_server.sql.administrator_login
}

output "sql_admin_password" {
  value     = var.sql_admin_password
  sensitive = true
}
