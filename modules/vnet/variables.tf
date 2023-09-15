variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network."
  type        = string
}

variable "address_space" {
  description = "Address space of the virtual network."
  type        = list(string)
}

variable "dns_servers" {
  description = "DNS servers of the virtual network."
  type        = list(string)
  default     = []
}

variable "subnets" {
  description = "Map of subnets"
  type = map(object({

    name                                          = string
    resource_group_name                           = string
    address_prefixes                              = list(string)
    private_link_service_network_policies_enabled = optional(bool)
  }))

  default = {}
}

variable "delegation_subnets" {
  description = "Map of subnets with delegation"
  type = map(object({

    resource_group_name                           = string
    address_prefixes                              = list(string)
    private_link_service_network_policies_enabled = optional(bool)
    delegation_name                               = string
    service_delegation_name                       = string
    service_delegation_actions                    = list(string)
  }))

  default = {}
}
variable "subnet_route_table_association" {
  description = "List of subnet route table associations."
  type        = list(map(string))
  default     = []
}

variable "enable_ddos_protection_plan" {
  description = "Enable the creation of DDoS protection plan."
  type        = bool
  default     = false
}

variable "ddos_protection_plan_name" {
  description = "Name of the DDoS protection plan."
  type        = string
  default     = ""
}

variable "ddos_protection_plan" {
  description = "DDoS protection plan configuration."
  type        = map(string)
  default     = null
}

variable "route_tables" {
  description = "List of route tables"
  type        = list(object({
    name                          = string
    disable_bgp_route_propagation = bool
  }))

  default = []
}

variable "tags" {
  description = "Tags to attach to the resources."
  type        = map(string)
  default     = {}
}
