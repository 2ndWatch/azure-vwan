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

module "s2s_law" {
  source = "../terraform-modules/log-analytics-workspace"

  resource_group_name = "demo-rg"
  name                = "demo-s2s-law"

  tags = {
    environment = "demo"
  }
}

module "vwan_s2s" {
  source = "../terraform-modules/vwan-s2s"

  resource_group_name        = "demo-rg"
  virtual_hub_id             = module.vwan.vwan_hub_id
  virtual_wan_id             = module.vwan.vwan_id
  address_cidrs              = ["10.0.0.0/16"]
  ip_address                 = "1.1.1.1"
  speed_in_mbps              = 50
  log_analytics_workspace_id = module.s2s_law.id

  tags = {
    environment = "demo"
  }
}