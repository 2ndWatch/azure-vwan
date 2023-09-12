output "firewall_id" {
  description = "The ID of the created Azure Firewall"
  value       = azurerm_firewall.this.id
}

output "firewall_name" {
  description = "The name of the created Azure Firewall"
  value       = azurerm_firewall.this.name
}

output "private_ip_address" {
  description = "The private IP address of the created Azure Firewall"
  value       = azurerm_firewall.this.virtual_hub[0].private_ip_address
}

output "public_ip_addresses" {
  description = "The public IP address of the created Azure Firewall"
  value       = azurerm_firewall.this.virtual_hub[0].public_ip_addresses[*]
}