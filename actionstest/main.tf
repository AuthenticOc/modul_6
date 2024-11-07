terraform {
    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = "4.0.1"
        }
    }

    backend "azurerm" {
   resource_group_name   = "rg-demo-backend-oc"
    storage_account_name  = "sademobackendoc"
    container_name        = "sc-backend-oc"
    key                   = "actiontest.terraform.tfstate"
  } 
}

provider "azurerm" {
   
    features {}
}

locals {
  workspaces_suffix = terraform.workspace   == "default" ? "" : "${terraform.workspace}"

    rg_name = "${var.rg_name}-${local.workspaces_suffix}"
}

resource "azurerm_resource_group" "rg_test" {
    name = local.rg_name
    location = var.rg_location
  
}