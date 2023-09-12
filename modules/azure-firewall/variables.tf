variable "resource_group_name" {
  description = "Name of the resource group for the Azure Firewall"
  type        = string
}

variable "sku_tier" {
  description = "SKU tier of the Azure Firewall"
  type        = string
}

variable "sku_name" {
  description = "SKU name of the Azure Firewall"
  type        = string
}

variable "zones" {
  description = "Availability zones to deploy the Azure Firewall"
  type        = list(string)
}

variable "virtual_hub_id" {
  description = "ID of the Azure Virtual WAN Hub to associate with the Azure Firewall"
  type        = string
}

variable "public_ip_count" {
  description = "Number of public IP addresses to associate with the Azure Firewall"
  type        = number
}

variable "firewall_policy_id" {
   description = "ID of the Azure Firewall Policy to associate with the Azure Firewall"
   type        = string
   default     = null
 }

 variable "tags" {
  description = "Tags to attach to the resources."
  type        = map(string)
  default     = {}
}
  