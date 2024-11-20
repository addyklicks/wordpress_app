variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet to attach AKS"
  type        = string
}

variable "resource_group" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for the deployment"
  type        = string
}
