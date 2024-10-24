variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}


variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which the storage account will be created."  
}

variable "location" {
  type        = string
  description = "The location/region where the resource group will be created."  
}

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account to create."
}

variable "sc_backend_name" {
  type        = string
  description = "The name of the storage container to create."  
}

variable "kv_backend_name" {
  type        = string
  description = "The name of the key vault to create."  
}

variable "sa_backend_access_key_name" {
  type        = string
  description = "The name of the secret to create."  
}