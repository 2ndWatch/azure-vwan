module "demo_workloads_vnet" {
  source = "../modules/vnet"

  resource_group_name = "demo-rg"
  vnet_name           = "workloads"
  address_space       = ["10.1.4.0/22"]
  dns_servers         = ["192.168.1.1"]

  subnets = {
    "web" = {
      name                = "demo-web-snet"
      resource_group_name = "demo-rg"
      address_prefixes    = ["10.1.4.0/24"]
    },
    "app" = {
      name                = "demo-app-snet"
      resource_group_name = "demo-rg"
      address_prefixes    = ["10.1.5.0/24"]
    },
    "db" = {
      name                = "demo-db-snet"
      resource_group_name = "demo-rg"
      address_prefixes    = ["10.1.6.0/24"]
    }
  }

  tags = {
    environment = "demo"
  }
}

module "shared_services_vnet" {
  source = "../modules/vnet"

  resource_group_name = "demo-rg"
  vnet_name           = "shared-services"
  address_space       = ["10.1.8.0/22"]
  dns_servers         = ["192.168.1.1"]

  subnets = {
    "shared" = {
      name                = "demo-shared-services-snet"
      resource_group_name = "demo-rg"
      address_prefixes    = ["10.1.8.0/24"]
    }
  }

  tags = {
    environment = "demo"
  }
}