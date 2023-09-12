# Terraform Azure Virtual WAN Module

This Terraform module deploys an Azure Virtual WAN (vWAN) and associated resources, such as Virtual Hubs, in the specified Azure resource group. The module provides flexibility in configuring the Virtual WAN and Virtual Hubs based on input variables.

## Example Usage

```hcl
module "virtual_wan" {
  source                           = "path/to/azure-virtual-wan"
  resource_group_name              = "my-resource-group"
  disable_vpn_encryption            = false
  allow_branch_to_branch_traffic    = false
  office365_local_breakout_category = "None"
  type                              = "Standard"
  

  address_prefix         = "10.0.0.0/24"
  hub_routing_preference = "None"
  sku                    = "Standard"
}

tags = {
    environment = "dev"
    project     = "my-app"
  }
```

## Inputs

The following table lists the input variables that can be configured when using this Terraform module:

| Name                                | Description                                           | Type           | Default | Required |
|-------------------------------------|-------------------------------------------------------|----------------|---------|----------|
| resource_group_name                 | The name of the resource group where the vWAN will be deployed. | string         | N/A     | Yes      |
| disable_vpn_encryption              | Boolean flag to specify whether branch to branch traffic is allowed. | bool           | false   | No       |
| allow_branch_to_branch_traffic      | Allow branch to branch traffic.                     | bool           | false   | No       |
| office365_local_breakout_category   | Specifies the Office365 local breakout category. Possible values include: Optimize, OptimizeAndAllow, All, None. | string | "None"  | No       |
| type                                | Specifies the Virtual WAN type. Possible values include: Basic and Standard. | string     | "Standard" | No       |
| tags                                | Tags to associate with the Virtual WAN and its resources. | map(string)  | {}    | No       |
| address_prefix                      | The address prefix to use for the Virtual Hub.      | string         | N/A     | Yes      |
| hub_routing_preference              | The Routing Preference to use for the Virtual Hub.   | string         | "None"  | No       |
| sku                                 | The SKU (tier) of the Virtual Hub.                   | string         | N/A     | Yes      |
## Outputs

The following table lists the output variables that are exposed after deploying the Virtual WAN and associated resources:

| Name          | Description                                           |
|---------------|-------------------------------------------------------|
| vwan_id       | The ID of the deployed Virtual WAN.                  |
| vwan_hub_id   | The ID of the deployed Virtual WAN hub.              |

## Note

This module assumes you have already authenticated with Azure using the necessary credentials. Make sure to include the required provider configuration in your Terraform configuration before using this module. and provide the connection details. 
-->

For more information on Azure Virtual WAN, please refer to the [Azure documentation](https://docs.microsoft.com/en-us/azure/virtual-wan/).