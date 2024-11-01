variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "rg_name" {
  description = "Resource Group Name"
  type        = string
  
}

variable "rg_location" {
  description = "Resource Group Location"
  type        = string
  
}

variable "sa_name" {
  description = "Storage Account Name"
  type        = string
  
}

variable "index_document" {
  description = "Index Document"
  type        = string
  default     = "index.html"
}


