module "vwan" {
  source = "../terraform-modules/vwan"

  resource_group_name            = "demo-rg"
  disable_vpn_encryption         = false
  allow_branch_to_branch_traffic = false
  type                           = "Standard"
  address_prefix                 = "10.1.0.0/22"
  hub_routing_preference         = "VpnGateway"
  sku                            = "Standard"

  tags = {
    environment = "demo"
  }
}