# Terraform Azure Firewall Module

## Purpose

This Terraform module deploys an Azure Firewall and associates it with an Azure Virtual WAN Hub. Azure Firewall is a managed, cloud-based network security service that helps protect your Azure Virtual Network resources. This module provides flexibility in configuring the Azure Firewall's SKU, location, and other properties, allowing you to tailor it to your specific needs.

## Example Usage

```hcl
module "azure_firewall" {
  source              = "./modules/azure-firewall"
  resource_group_name = "my-resource-group"
  sku_tier            = "Standard"
  sku_name            = "AZFW_Hub"
  zones               = ["1", "2", "3"]
  tags                = {
    Environment = "Dev"
    Department  = "IT"
  }

  virtual_hub_id    = "virtual_hub_id_here"
  public_ip_count   = 2
  firewall_policy_id = "firewall_policy_id_here"
}
```

## Inputs

| Name                 | Description                                           | Type     | Default | Required |
|----------------------|-------------------------------------------------------|----------|---------|----------|
| resource_group_name  | Name of the resource group for the Azure Firewall    | string   |         | yes      |
| sku_tier             | SKU tier of the Azure Firewall                       | string   |         | yes      |
| sku_name             | SKU name of the Azure Firewall                       | string   |         | yes      |
| zones                | Availability zones to deploy the Azure Firewall      | list     |         | yes      |
| virtual_hub_id       | ID of the Azure Virtual WAN Hub to associate        | string   |         | yes      |
| public_ip_count      | Number of public IP addresses to associate           | number   |         | yes      |
| firewall_policy_id   | ID of the Azure Firewall Policy to associate        | string   | null    | no       |
| tags                 | Tags to attach to the resources                      | map      | {}      | no       |

## Outputs

| Name               | Description                                        |
|--------------------|----------------------------------------------------|
| firewall_id        | The ID of the created Azure Firewall              |
| firewall_name      | The name of the created Azure Firewall            |
| private_ip_address | The private IP address of the Azure Firewall      |
| public_ip_addresses| The public IP addresses of the Azure Firewall     |