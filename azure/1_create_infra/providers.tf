terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      # only upgrades of fix version are allowed
      version = "~>3.89.0"
    }
  }

  backend "azurerm" {
  }
}

provider "azurerm" {
  # Configuration options
  features {

    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }

  client_id       = var.SP_CLIENT_ID
  client_secret   = var.SP_CLIENT_SECRET
  tenant_id       = var.SP_TENANT_ID
  subscription_id = var.AZ_SUBSCRIPTION_ID
}
