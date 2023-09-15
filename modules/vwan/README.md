# Terraform Azure Virtual WAN Module

This Terraform module deploys an Azure Virtual WAN with associated Virtual Hub.

## Purpose

The purpose of this Terraform code is to provision an Azure Virtual WAN and a Virtual Hub within a specified Azure Resource Group. The module allows you to configure various settings of the Virtual WAN and Virtual Hub, such as encryption options, routing preferences, and tags.

## Example Usage

```hcl
module "azure_virtual_wan" {
  source  = "./path/to/module"

  resource_group_name               = "my-resource-group"
  disable_vpn_encryption            = true
  allow_branch_to_branch_traffic    = false
  office365_local_breakout_category = "Optimize"
  type                              = "Standard"
  tags = {
    Environment = "Development"
    Department  = "IT"
  }
  address_prefix         = "10.0.0.0/24"
  hub_routing_preference = "None"
  sku                    = "Standard"
}
```

## Inputs

| Name                                | Description                                             | Type      | Default                   |
|-------------------------------------|---------------------------------------------------------|-----------|---------------------------|
| resource_group_name                 | The name of the resource group where the vWAN will be deployed. | string    |                           |
| disable_vpn_encryption              | Boolean flag to specify whether branch to branch traffic is allowed. | bool      | false                     |
| allow_branch_to_branch_traffic      | Allow branch to branch traffic.                         | bool      | false                     |
| office365_local_breakout_category   | Specifies the Office365 local breakout category. Possible values include: Optimize, OptimizeAndAllow, All, None. | string | "None"                    |
| type                                | Specifies the Virtual WAN type. Possible Values include: Basic and Standard. | string | "Standard"                |
| tags                                | A mapping of tags to assign to the resource.            | map(string) | {}                      |
| address_prefix                      | The address prefix to use for the Virtual Hub.          | string    |                           |
| hub_routing_preference              | The Routing Preference to use for the Virtual Hub.       | string    | "None"                    |
| sku                                 | Value for SKU.                                          | string    |                           |

## Outputs

| Name           | Description                             |
|----------------|-----------------------------------------|
| vwan_id        | The ID of the deployed vWAN.            |
| vwan_hub_id    | The ID of the deployed vWAN hub.        |

## Important Notes

- Ensure that you have the necessary Azure permissions and configurations in place to deploy Virtual WAN resources.
- Review and adjust the input variables according to your specific requirements.

For more information on Azure Virtual WAN, please refer to the [Azure documentation](https://docs.microsoft.com/en-us/azure/virtual-wan/).