module "resource_group" {
  source   = "./resource_group"
  name     = "rg-test"
  azregion = "centralus"
}

module "az_sql" {
  source             = "./az_sql"
  rg-name            = module.resource_group.resource_group_name
  azregion           = module.resource_group.resource_group_location
  sql_server_name    = "sql-aztest0132"
  sql_db_name        = "sqldb-aztest0132"
  sql_admin_login    = "sqladminuser"
  sql_admin_password = var.sql_admin_password

  depends_on = [module.resource_group]
}

module "az_webapps" {
  source      = "./az_webapps"
  webapp-name = "webapp-aztest0132"
  rg-name     = module.resource_group.resource_group_name
  azregion    = module.resource_group.resource_group_location

  sql_fqdn       = module.az_sql.sql_server_fqdn
  sql_db_name    = module.az_sql.sql_db_name
  sql_admin_user = module.az_sql.sql_admin_username
  sql_admin_pass = module.az_sql.sql_admin_password

  depends_on = [module.az_sql, module.resource_group]
}
