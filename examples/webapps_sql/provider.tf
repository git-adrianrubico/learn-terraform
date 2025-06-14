terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.25.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "ab801633-5ca9-4204-ae1f-c86768569f1e"
  features {}
}