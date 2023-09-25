# Terraform Azure Virtual Network Module

This Terraform module creates an Azure Virtual Network with subnets, route tables, and optional DDoS protection plan.

## Purpose

This Terraform module is designed to provision an Azure Virtual Network with the following components:

- Virtual Network
- Subnets
- Delegated Subnets (Optional)
- Route Tables
- Subnet Route Table Associations
- DDoS Protection Plan (Optional)

## Example Usage

```hcl
module "azure_virtual_network" {
  source                 = "path/to/module"
  resource_group_name    = "my-resource-group"
  vnet_name              = "my-vnet"
  address_space          = ["10.0.0.0/16"]
  dns_servers            = ["8.8.8.8", "8.8.4.4"]
  subnets = {
    subnet1 = {
      name                    = "subnet1"
      resource_group_name     = "subnet-rg"
      address_prefixes        = ["10.0.1.0/24"]
      private_link_service_network_policies_enabled = true
    }
    subnet2 = {
      name                    = "subnet2"
      resource_group_name     = "subnet-rg"
      address_prefixes        = ["10.0.2.0/24"]
    }
  }
  delegation_subnets = {
    delegated_subnet = {
      resource_group_name     = "subnet-rg"
      address_prefixes        = ["10.0.3.0/24"]
      private_link_service_network_policies_enabled = true
      delegation_name         = "delegation1"
      service_delegation_name = "Microsoft.ContainerInstance/containerGroups"
      service_delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
  subnet_route_table_association = [
    {
      subnet_name   = "subnet1"
      route_table_id = "my-route-table"
    }
  ]
  enable_ddos_protection_plan = true
  ddos_protection_plan_name   = "my-ddos-plan"
  ddos_protection_plan = {
    enabled  = true
    basic_sku = "Standard_Basic"
  }
  route_tables = [
    {
      name                          = "route-table1"
      disable_bgp_route_propagation = false
    }
  ]
  tags = {
    environment = "dev"
    owner       = "terraform"
  }
}
```

## Inputs

### General Inputs

| Name                         | Description                                  | Type   | Default    |
|------------------------------|----------------------------------------------|--------|------------|
| `resource_group_name`        | Name of the resource group.                 | string | N/A        |
| `vnet_name`                  | Name of the virtual network.                | string | N/A        |
| `address_space`              | Address space of the virtual network.       | list   | N/A        |
| `dns_servers`                | DNS servers of the virtual network.         | list   | []         |
| `subnets`                    | Map of subnets.                              | map    | {}         |
| `delegation_subnets`         | Map of subnets with delegation.              | map    | {}         |
| `subnet_route_table_association` | List of subnet route table associations. | list   | []         |
| `enable_ddos_protection_plan` | Enable the creation of DDoS protection plan. | bool | false      |
| `ddos_protection_plan_name` | Name of the DDoS protection plan.           | string | ""        |
| `ddos_protection_plan`       | DDoS protection plan configuration.         | map    | null       |
| `route_tables`               | List of route tables.                        | list   | []         |
| `tags`                       | Tags to attach to the resources.            | map    | {}         |

### Subnet Inputs

Each subnet in the `subnets` and `delegation_subnets` maps should have the following properties:

| Name                                      | Description                                      | Type    | Default           |
|-------------------------------------------|--------------------------------------------------|---------|-------------------|
| `name`                                    | Name of the subnet.                              | string  | N/A               |
| `resource_group_name`                     | Name of the subnet's resource group.             | string  | N/A               |
| `address_prefixes`                        | Address prefixes for the subnet.                 | list    | N/A               |
| `private_link_service_network_policies_enabled` | Enable private link service network policies. | bool    | false             |
| `delegation_name`                         | Name of the delegation.                          | string  | (Optional)        |
| `service_delegation_name`                 | Name of the service delegation.                  | string  | (Optional)        |
| `service_delegation_actions`              | List of service delegation actions.              | list    | (Optional)        |

### Route Table Inputs

Each route table in the `route_tables` list should have the following properties:

| Name                                      | Description                                      | Type    | Default           |
|-------------------------------------------|--------------------------------------------------|---------|-------------------|
| `name`                                    | Name of the route table.                         | string  | N/A               |
| `disable_bgp_route_propagation`           | Disable BGP route propagation.                   | bool    | false             |

## Outputs

| Name                                      | Description                                      |
|-------------------------------------------|--------------------------------------------------|
| `virtual_network_id`                      | ID of the created virtual network.              |
| `subnet_ids`                              | List of IDs of the created subnets.             |
| `route_table_ids`                         | List of IDs of the created route tables.        |
| `vnet_address_space`                      | Address space of the created virtual network.   |
| `subnet_address_spaces`                   | List of address spaces of the created subnets.  |