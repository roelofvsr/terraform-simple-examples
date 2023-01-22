# providers and versions
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.29"
    }
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.6"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4"
    }
  }

  # terraform version 
  required_version = "~> 1.3"

  # backend "azurerm" {
  #   resource_group_name  = "StorageAccount-ResourceGroup"
  #   storage_account_name = "abcd1234"
  #   container_name       = "tfstate"               # put this in yaml flow
  #   key                  = "dev.terraform.tfstate" # put this in yaml flow
  # }
}

provider "azurerm" {
  features {}
}

provider "databricks" {
  azure_workspace_resource_id = module.dbw-standard.id
  # azure_client_id             = var.ARM_CLIENT_ID
  # azure_client_secret         = var.ARM_CLIENT_SECRET
  # azure_tenant_id             = var.ARM_TENANT_ID
}
