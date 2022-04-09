terraform {
  backend "azure" {
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "RG-Terraform" {
  name     = var.resource_group_name
  location = var.location
}

