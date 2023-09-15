# Terraform Azure Virtual Network Module

This Terraform module deploys an Azure Virtual Network (VNet) with subnets and route tables in a specified Azure Resource Group. It also supports subnet delegation and DDoS protection plan configuration.

## Purpose

The purpose of this Terraform code is to provision a Virtual Network in Azure with various subnets, associated route tables, and optional DDoS protection plan settings. This module provides flexibility in configuring the VNet, allowing you to define address spaces, DNS servers, and more.

## Example Usage

```hcl
module "azure_virtual_network" {
  source = "./path/to/module"

  resource_group_name  = "my-resource-group"
  vnet_name            = "my-vnet"
  address_space        = ["10.0.0.0/16"]
  dns_servers          = ["8.8.8.8"]
  
  subnets = {
    subnet1 = {
      name                = "subnet1"
      resource_group_name = "subnet1-rg"
      address_prefixes    = ["10.0.1.0/24"]
    }
    subnet2 = {
      name                = "subnet2"
      resource_group_name = "subnet2-rg"
      address_prefixes    = ["10.0.2.0/24"]
    }
  }

  delegation_subnets = {
    delegated-subnet1 = {
      resource_group_name        = "delegated-rg"
      address_prefixes           = ["10.0.3.0/24"]
      delegation_name            = "Microsoft.Web/serverFarms"
      service_delegation_name    = "Microsoft.Web/serverFarms"
      service_delegation_actions = ["Microsoft.Web/serverFarms/read", "Microsoft.Web/serverFarms/write"]
    }
  }

  subnet_route_table_association = [
    {
      subnet_name    = "subnet1"
      route_table_id = azurerm_route_table.this[0].id
    },
    {
      subnet_name    = "subnet2"
      route_table_id = azurerm_route_table.this[1].id
    }
  ]

  route_tables = [
    {
      name                          = "route-table1"
      disable_bgp_route_propagation = true
    },
    {
      name                          = "route-table2"
      disable_bgp_route_propagation = false
    }
  ]
  
  enable_ddos_protection_plan = true
  ddos_protection_plan_name   = "my-ddos-plan"

  ddos_protection_plan = {
    protocols  = ["Tcp"]
    mitigation = "Standard"
  }
  
  tags = {
    Environment = "Production"
    Department  = "IT"
  }
}
```

## Inputs

| Name                                 | Description                                             | Type          | Default                   |
|--------------------------------------|---------------------------------------------------------|---------------|---------------------------|
| resource_group_name                  | Name of the resource group.                              | string        |                           |
| vnet_name                            | Name of the virtual network.                            | string        |                           |
| address_space                        | Address space of the virtual network.                   | list(string)  |                           |
| dns_servers                          | DNS servers of the virtual network.                     | list(string)  | []                        |
| subnets                              | Map of subnets to create within the VNet.               | map(object)   | {}                        |
| delegation_subnets                   | Map of subnets with delegation.                          | map(object)   | {}                        |
| subnet_route_table_association       | List of subnet route table associations.                | list(map(string)) | []                   |
| route_tables                         | List of route tables to create and associate with subnets. | list(object) | []                        |
| enable_ddos_protection_plan          | Enable the creation of DDoS protection plan.            | bool          | false                     |
| ddos_protection_plan_name            | Name of the DDoS protection plan.                       | string        | ""                        |
| ddos_protection_plan                 | DDoS protection plan configuration.                     | map(string)   | null                      |
| tags                                 | Tags to attach to the resources.                         | map(string)   | {}                        |

## Outputs

| Name                           | Description                               |
|--------------------------------|-------------------------------------------|
| virtual_network_id             | ID of the created virtual network.        |
| subnet_ids                     | List of IDs of the created subnets.       |
| route_table_ids                | List of IDs of the created route tables.  |
| vnet_address_space             | Address space of the created virtual network. |
| subnet_address_spaces          | List of address spaces of the created subnets. |

## Dependencies

This module depends on the AzureRM provider and requires valid Azure credentials to be configured.

## Important Notes

- Ensure that you have the necessary Azure permissions and configurations in place to deploy Virtual Network resources.
- Review and adjust the input variables according to your specific requirements.