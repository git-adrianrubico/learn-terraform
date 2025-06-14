module "resource_group" {
  source   = "./resource_group"
  name     = "rg-test"
  azregion = "EAST US"
}

module "az_sql" {
  source             = "./az_sql"
  rg-name            = module.resource_group.resource_group_name
  azregion           = module.resource_group.resource_group_location
  sql_server_name    = "sql-test01"
  sql_db_name        = "sqldb-test01"
  sql_admin_login    = "sqladminuser"
  sql_admin_password = var.sql_admin_password
}

module "az_webapps" {
  source      = "./az_webapps"
  webapp-name = "webapp-test01"
  rg-name     = module.resource_group.resource_group_name
  azregion    = module.resource_group.resource_group_location

  sql_fqdn       = module.az_sql.sql_server_fqdn
  sql_db_name    = module.az_sql.sql_db_name
  sql_admin_user = module.az_sql.sql_admin_username
  sql_admin_pass = module.az_sql.sql_admin_password
}
