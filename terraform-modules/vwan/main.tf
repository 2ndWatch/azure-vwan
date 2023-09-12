locals {
  name = "demo"
}

data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

resource "azurerm_virtual_wan" "this" {
  name                = "${local.name}-vwan"
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location

  disable_vpn_encryption            = var.disable_vpn_encryption
  allow_branch_to_branch_traffic    = var.allow_branch_to_branch_traffic
  office365_local_breakout_category = var.office365_local_breakout_category
  type                              = var.type
  tags                              = var.tags
}

resource "azurerm_virtual_hub" "this" {
  name                   = "${local.name}-vwan-hub"
  resource_group_name    = data.azurerm_resource_group.this.name
  location               = data.azurerm_resource_group.this.location
  address_prefix         = var.address_prefix
  hub_routing_preference = var.hub_routing_preference
  sku                    = var.sku
  virtual_wan_id         = azurerm_virtual_wan.this.id
  tags                   = var.tags
  
  depends_on = [azurerm_virtual_wan.this]
}