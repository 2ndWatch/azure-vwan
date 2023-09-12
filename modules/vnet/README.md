Certainly, here's a `README.md` file for the provided Terraform code with sections for "Purpose," "Example Usage," "Inputs," and "Outputs":

```markdown
# Terraform Azure Virtual Network Module

## Purpose

This Terraform module deploys an Azure Virtual Network (VNet) along with subnets and route tables, allowing you to create a flexible and isolated network environment in Azure. You can customize the address space, subnets, route tables, and other settings to meet your specific networking requirements.

## Example Usage

```hcl
module "azure_virtual_network" {
  source              = "./modules/azure-virtual-network"
  resource_group_name = "my-resource-group"
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["8.8.8.8", "8.8.4.4"]
  tags                = {
    Environment = "Dev"
    Department  = "IT"
  }

  subnets = {
    "subnet1" = {
      name                                          = "subnet1"
      resource_group_name                           = "subnet-rg"
      address_prefixes                              = ["10.0.1.0/24"]
      private_link_service_network_policies_enabled = true
    },
    "subnet2" = {
      name                                          = "subnet2"
      resource_group_name                           = "subnet-rg"
      address_prefixes                              = ["10.0.2.0/24"]
      private_link_service_network_policies_enabled = true
    }
  }

  delegation_subnets = {
    "delegated-subnet" = {
      resource_group_name                           = "subnet-rg"
      address_prefixes                              = ["10.0.3.0/24"]
      private_link_service_network_policies_enabled = true
      delegation_name                               = "MyDelegation"
      service_delegation_name                       = "Microsoft.EventHub/eventHubs"
      service_delegation_actions                    = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }

  subnet_route_table_association = [
    {
      subnet_name   = "subnet1"
      route_table_id = "route-table-id-1"
    },
    {
      subnet_name   = "subnet2"
      route_table_id = "route-table-id-2"
    }
  ]

  route_tables = [
    {
      name                          = "my-route-table-1"
      disable_bgp_route_propagation = true
    },
    {
      name                          = "my-route-table-2"
      disable_bgp_route_propagation = false
    }
  ]
}
```

## Inputs

| Name                             | Description                                                      | Type           | Default | Required |
|----------------------------------|------------------------------------------------------------------|----------------|---------|----------|
| resource_group_name              | Name of the resource group where the VNet will be created.      | string         |         | yes      |
| address_space                    | Address space of the VNet.                                      | list(string)   |         | yes      |
| dns_servers                      | List of DNS server IP addresses.                                | list(string)   | []      | no       |
| subnets                          | Map of subnets to create within the VNet.                        | map(object)    | {}      | no       |
| delegation_subnets               | Map of subnets with delegation configurations.                   | map(object)    | {}      | no       |
| subnet_route_table_association   | List of subnet route table associations.                        | list(map(string)) | []   | no       |
| enable_ddos_protection_plan      | Enable the creation of a DDoS protection plan.                  | bool           | false   | no       |
| ddos_protection_plan_name        | Name of the DDoS protection plan.                                | string         |         | no       |
| ddos_protection_plan             | DDoS protection plan configuration.                              | map(string)    | null    | no       |
| route_tables                     | List of route tables to create.                                  | list(object)   | []      | no       |
| tags                             | Tags to attach to the resources.                                 | map(string)    | {}      | no       |

## Outputs

| Name                      | Description                                   |
|---------------------------|-----------------------------------------------|
| virtual_network_id        | ID of the created virtual network.            |
| subnet_ids                | List of IDs of the created subnets.           |
| route_table_ids           | List of IDs of the created route tables.      |
| vnet_address_space        | Address space of the created virtual network. |
| subnet_address_spaces     | List of address spaces of the created subnets.|

```

Please ensure that you replace the placeholder values in the example usage section (`resource_group_name`, `address_space`, etc.) with your specific configuration values when using this module in your Terraform code.