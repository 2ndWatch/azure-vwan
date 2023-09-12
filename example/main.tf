terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  backend "azurerm" {
    resource_group_name  = ""
    storage_account_name = ""
    container_name       = ""
    key                  = ""
    use_azuread_auth     = true
    subscription_id      = ""
    tenant_id            = ""
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.9.0, < 3.52.0"
    }
  }
}

provider "azurerm" {
  subscription_id      = ""
  tenant_id            = ""

  features {}
}