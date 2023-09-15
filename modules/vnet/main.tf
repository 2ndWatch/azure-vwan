locals {
  name = "demo"
}

data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "this" {
  name                = "${local.name}--${var.vnet_name}-vnet"
  address_space       = var.address_space
  location            = data.azurerm_resource_group.this.location
  resource_group_name = var.resource_group_name
  dns_servers         = var.dns_servers
  tags                = var.tags
}

resource "azurerm_subnet" "subnets" {
  for_each = var.subnets

  name                                           = each.value["name"]
  resource_group_name                            = each.value["resource_group_name"]
  virtual_network_name                           = azurerm_virtual_network.this.name
  address_prefixes                               = each.value["address_prefixes"]
  enforce_private_link_endpoint_network_policies = each.value["private_link_service_network_policies_enabled"]

  depends_on = [azurerm_virtual_network.this]
}

resource "azurerm_subnet" "delegation_subnets" {
  for_each = var.delegation_subnets

  name                 = "${local.name}-snet"
  resource_group_name  = each.value["resource_group_name"]
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = each.value["address_prefixes"]

  enforce_private_link_endpoint_network_policies = each.value["private_link_service_network_policies_enabled"]

  delegation {
    name = each.value["delegation_name"]

    service_delegation {
      name    = each.value["service_delegation_name"]
      actions = each.value["service_delegation_actions"]
    }
  }

  depends_on = [azurerm_virtual_network.this]
}

resource "azurerm_subnet_route_table_association" "this" {
  for_each = { for idx, association in var.subnet_route_table_association : tostring(idx) => association }

  subnet_id      = azurerm_subnet.subnets[each.value.subnet_name].id
  route_table_id = each.value.route_table_id

  depends_on = [azurerm_virtual_network.this]
}

resource "azurerm_route_table" "this" {
  count = length(var.route_tables)

  name                          = "${var.route_tables[count.index]["name"]}-rt"
  resource_group_name           = var.resource_group_name
  location                      = data.azurerm_resource_group.this.location
  disable_bgp_route_propagation = var.route_tables[count.index]["disable_bgp_route_propagation"]

  tags = var.tags
}