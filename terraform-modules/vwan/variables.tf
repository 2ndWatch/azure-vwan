variable "resource_group_name" {
  description = "The name of the resource group where the vWAN will be deployed."
  type        = string
}

variable "disable_vpn_encryption" {
  description = "Boolean flag to specify whether branch to branch traffic is allowed"
  type        = bool
  default     = false
}

variable "allow_branch_to_branch_traffic" {
  description = "Allow branch to branch traffic."
  type        = bool
  default     = false
}

variable "office365_local_breakout_category" {
  description = "Specifies the Office365 local breakout category. Possible values include: Optimize, OptimizeAndAllow, All, None."
  type        = string
  default     = "None"
}

variable "type" {
  description = "Specifies the Virtual WAN type. Possible Values include: Basic and Standard."
  type        = string
  default     = "Standard"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "address_prefix" {
  description = "The address prefix to use for the Virtual Hub."
  type        = string
}

variable "hub_routing_preference" {
  description = "The Routing Preference to use for the Virtual Hub."
  type        = string
  default     = "None"
}

variable "sku" {
  description = "value for sku"
  type        = string
}