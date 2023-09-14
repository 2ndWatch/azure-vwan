module "azure_firewall" {
  source              = "../modules/azure-firewall"
  resource_group_name = "demo-rg"
  sku_tier            = "Standard"
  sku_name            = "AZFW_Hub"
  zones               = ["1", "2", "3"]
  virtual_hub_id      = module.vwan.vwan_hub_id
  public_ip_count     = 1

  tags                = {
    environment = "demo"
  }
}