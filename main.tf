resource "azurerm_resource_group" "azureSql" {
  name     = "azureSql-plaything-rg"
  location = "Australia East"
}

resource "azurerm_mssql_server" "azureSql" {
  name                         = "azureSqlserver"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "missadministrator"
  administrator_login_password = "thisIsKat11"
  minimum_tls_version          = "1.2"

  azuread_administrator {
    login_username = "AzureAD Admin"
    object_id      = "00000000-0000-0000-0000-000000000000"
  }

  tags = {
    environment = "production"
  }
}
