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
    key                   = "backend.terraform.tfstate"
  } 
}

provider "azurerm" {
    subscription_id = var.subscription_id
    features {}
}

resource "azurerm_resource_group" "rg_backend" {
  name     = var.resource_group_name
  location = var.location
}

# Create a storage account
resource "azurerm_storage_account" "sa_backend" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg_backend.name
  location                 = azurerm_resource_group.rg_backend.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Create a storage container
resource "azurerm_storage_container" "sc_backend" {
  name                  = var.sc_backend_name
  storage_account_name  = azurerm_storage_account.sa_backend.name
  container_access_type = "private"
}

# Create a key vault
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv_backend" {
  name                        = var.kv_backend_name
  location                    = azurerm_resource_group.rg_backend.location
  resource_group_name         = azurerm_resource_group.rg_backend.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
       "Get", "List", "Create",
      
    ]

    secret_permissions = [
        "Get", "Set", "List",
    ]

    storage_permissions = [
      "Get", "Set", "List",
    ]
  }
}

resource "azurerm_key_vault_secret" "sa_backend_access_key" {
  name         = var.sa_backend_access_key_name
  value        = azurerm_storage_account.sa_backend.primary_access_key
  key_vault_id = azurerm_key_vault.kv_backend.id
}

