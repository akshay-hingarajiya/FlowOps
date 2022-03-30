provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "rg" {
  name = "module-db"
  # location = "East US"
}

resource "azurerm_storage_account" "example" {
  name                     = var.azurerm_storage_account
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  allow_blob_public_access = true
  account_replication_type = "LRS"
}
resource "azurerm_app_service_plan" "example" {
  name                = var.azurerm_app_service_plan
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  kind                = "FunctionApp"
  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}
resource "azurerm_function_app" "example" {
  name                       = var.azurerm_function_app
  location                   = data.azurerm_resource_group.rg.location
  resource_group_name        = data.azurerm_resource_group.rg.name
  app_service_plan_id        = "${azurerm_app_service_plan.example.id}"
  storage_account_name       = "${azurerm_storage_account.example.name}"
  storage_account_access_key = "${azurerm_storage_account.example.primary_access_key}"
}


# resource "azurerm_function_app" "example1" {
#   name                       = var.azurerm_function_app1
#   location                   = data.azurerm_resource_group.rg.location
#   resource_group_name        = data.azurerm_resource_group.rg.name
#   app_service_plan_id        = "${azurerm_app_service_plan.example.id}"
#   storage_account_name       = "${azurerm_storage_account.example.name}"
#   storage_account_access_key = "${azurerm_storage_account.example.primary_access_key}"
# }

# resource "azurerm_function_app" "example2" {
#   name                       = var.azurerm_function_app2
#   location                   = data.azurerm_resource_group.rg.location
#   resource_group_name        = data.azurerm_resource_group.rg.name
#   app_service_plan_id        = "${azurerm_app_service_plan.example.id}"
#   storage_account_name       = "${azurerm_storage_account.example.name}"
#   storage_account_access_key = "${azurerm_storage_account.example.primary_access_key}"
# }

# resource "azurerm_function_app" "example3" {
#   name                       = var.azurerm_function_app3
#   location                   = data.azurerm_resource_group.rg.location
#   resource_group_name        = data.azurerm_resource_group.rg.name
#   app_service_plan_id        = "${azurerm_app_service_plan.example.id}"
#   storage_account_name       = "${azurerm_storage_account.example.name}"
#   storage_account_access_key = "${azurerm_storage_account.example.primary_access_key}"
# }
