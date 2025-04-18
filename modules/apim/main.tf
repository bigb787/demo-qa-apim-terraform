resource "azurerm_resource_group" "apim-rg" {
   name = "${var.name_prefix}-${var.apim-name}-rg"
   location = var.location
    tags = {
    environment = var.env
  }
}
resource "azurerm_api_management" "apim" {
    name = var.apim-name
    location = azurerm_resource_group.apim-rg.location
    resource_group_name = azurerm_resource_group.apim-rg.name
    publisher_email = "bigb787@gmail.com"
    sku_name = var.sku_name
    publisher_name = "bigb787"
}

resource "azurerm_application_insights" "app_insights" {
  name                = var.apim-name
  location            = azurerm_resource_group.apim-rg.location
  resource_group_name = azurerm_resource_group.apim-rg.name
  application_type    = "web"
}

resource "azurerm_api_management_logger" "logger" {
  name                = var.logger
  api_management_name = azurerm_api_management.apim.name
  resource_group_name = azurerm_resource_group.apim-rg.name
  
  application_insights {
    instrumentation_key = azurerm_application_insights.app_insights.instrumentation_key
  }
  }