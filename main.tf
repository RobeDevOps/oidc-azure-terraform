terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.50"
    }
  }

  required_version = ">= 1.9.5"
}

provider "azurerm" {
  features {}
}
