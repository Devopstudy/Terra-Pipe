terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.0"
    }
  }
}



provider "azurerm" {
  features {}
  subscription_id = "def13e29-f65a-496b-b10e-3cffca9a480f"
}

resource "azurerm_resource_group" "rg-update" {
  name     = "rg-update"
  location = "central india"
}

resource "azurerm_resource_group" "rg-update_2" {
  name     = "rg-update_2"
  location = "central india"
}