variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "rg_name" {
  description = "Resource Group Name"
  type        = string
  default = "rg-demo-oc"
  
}

variable "rg_location" {
  description = "Resource Group Location"
  type        = string
  default     = "westeurope"
  
}

variable "sa_name" {
  description = "Storage Account Name"
  type        = string
  default     = "sademoweboc"
  
}

variable "index_document" {
  description = "Index Document"
  type        = string
  default     = "index.html"
}


