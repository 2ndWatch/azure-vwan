output "virtual_network_id" {
  value       = azurerm_virtual_network.this.id
  description = "ID of the created virtual network."
}

output "subnet_ids" {
  value       = [for subnet in azurerm_subnet.subnets : subnet.id]
  description = "List of IDs of the created subnets."
}

output "route_table_ids" {
  value       = azurerm_route_table.this[*].id
  description = "List of IDs of the created route tables."
}

output "vnet_address_space" {
  value       = azurerm_virtual_network.this.address_space
  description = "Address space of the created virtual network."
}

output "subnet_address_spaces" {
  value       = [for subnet in azurerm_subnet.subnets : subnet.address_prefixes]
  description = "List of address spaces of the created subnets."
}