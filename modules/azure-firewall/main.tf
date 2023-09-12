locals {
  name = "demo"
}

data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

resource "azurerm_firewall" "this" {
  name                = "${local.name}-fw"
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  sku_tier            = var.sku_tier
  sku_name            = var.sku_name
  zones               = var.zones
  tags                = var.tags

  virtual_hub {
    virtual_hub_id  = var.virtual_hub_id
    public_ip_count = var.public_ip_count
  }

  firewall_policy_id = var.firewall_policy_id
}