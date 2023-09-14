terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  backend "azurerm" {
    resource_group_name  = "jacob-acton-test-rg"
    storage_account_name = "2wjactonvwan"
    container_name       = "tfstate"
    key                  = "vwan-tf-state-east-us.tfstate"
    use_azuread_auth     = true
    subscription_id      = "13b706d3-f7a2-4e89-91d3-921288c68091"
    tenant_id            = "8242a0a9-c415-4206-be39-06637ad2817a"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.9.0, < 3.52.0"
    }
  }
}

provider "azurerm" {
  subscription_id      = "13b706d3-f7a2-4e89-91d3-921288c68091"

  features {}
}