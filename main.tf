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

# Creates Resource Group
resource "azurerm_resource_group" "RG-Terraform" {
  name     = var.resource_group_name
  location = var.location
}

#Creates Container for API 
resource "azurerm_container_group" "Container-API" {
  name                      = "weatherapi"
  location                  = azurerm_resource_group.RG-Terraform.location
  resource_group_name       = azurerm_resource_group.RG-Terraform.name

  ip_address_type     = "Public"
  dns_name_label      = "pavelsweatherapi"
  os_type             = "Linux"

  container {
      name            = "weatherapi"
      image           = "465848451629697498456112665444/weatherapi"
        cpu             = "1"
        memory          = "1"

        ports {
            port        = 80
            protocol    = "TCP"
        }
  }
}