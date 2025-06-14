output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "az_webapps_name" {
  value = module.az_webapps.webapp_name
}

output "az_sql_name" {
  value = module.az_sql.sql_server_name
}