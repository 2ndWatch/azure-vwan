output "vwan_id" {
  description = "The ID of the deployed vWAN."
  value       = azurerm_virtual_wan.this.id
}

output "vwan_hub_id" {
  description = "The ID of the deployed vWAN hub."
  value       = azurerm_virtual_hub.this.id
}