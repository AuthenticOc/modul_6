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
    key                   = "web.terraform.tfstate"
  } 
}

provider "azurerm" {
    subscription_id = var.subscription_id
    features {}
}