
resource "azurerm_service_plan" "webapp_serviceplan" {
  name                = var.webapp-name
  resource_group_name = var.rg-name
  location            = var.azregion
  sku_name            = "B1"
  os_type             = "Linux"
}

resource "azurerm_linux_web_app" "webapp" {
  name                = var.webapp-name
  resource_group_name = azurerm_service_plan.webapp_serviceplan.resource_group_name
  location            = azurerm_service_plan.webapp_serviceplan.location
  service_plan_id     = azurerm_service_plan.webapp_serviceplan.id

  site_config {
    application_stack {
      dotnet_version = "6.0"
    }
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
  name  = "Database"
  type  = "SQLAzure"
  value = "Server=tcp:${var.sql_fqdn},1433;Initial Catalog=${var.sql_db_name};User ID=${var.sql_admin_user};Password=${var.sql_admin_pass};Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
}

}