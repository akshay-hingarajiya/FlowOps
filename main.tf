provider "azurerm" {
  features {}
}

module "func" {
  source = "./module"
}

# module "func1" {
#   source = "./modules/function_app"
#   azurerm_function_app = "module-fa1"
#   azurerm_storage_account = "funstoreacc1"
#   azurerm_app_service_plan = "spfa2"
# }

# module "func2" {
#   source = "./modules/function_app"
#   azurerm_function_app = "module-fa2"
#   #azurerm_storage_account = "funstoreacc1"
#   #azurerm_app_service_plan = "spfa2"
# }