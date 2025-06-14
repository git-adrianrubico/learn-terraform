output "webapp_serviceplan_name" {
    value = azurerm_service_plan.webapp_serviceplan.name
}

output "webapp_name" {
    value = azurerm_linux_web_app.webapp.name
}