# Azure S2S Troubleshooting with Log Analytics Workspace

## Purpose

This Terraform code deploys an Azure Site-to-Site (S2S) Virtual Network Gateway (VPN Gateway) and associates it with an Azure Virtual WAN. Additionally, it creates a Log Analytics Workspace to collect and store VPN Gateway logs for troubleshooting purposes. The Log Analytics Workspace enables central log monitoring and analysis, providing insights into VPN Gateway connectivity and any potential issues that may arise during the S2S setup and operations.

## Supporting Links

- [Azure Virtual WAN Documentation](https://docs.microsoft.com/en-us/azure/virtual-wan/)
- [Azure VPN Gateway Documentation](https://docs.microsoft.com/en-us/azure/vpn-gateway/)
- [Troubleshoot Azure VPN Gateway using diagnostic logs](https://learn.microsoft.com/en-us/azure/vpn-gateway/troubleshoot-vpn-with-azure-diagnostics#GatewayDiagnosticLog)  This link contains a few Log Analytics queries that can be used to troubleshoot site-to-site connectivity issues. The "IKEDiagnosticLog" Query is especially useful.

## Notes

- Ensure you have the necessary permissions and authentication configured to deploy the resources using this Terraform code. Additionally, follow the documentation links provided to gain a deeper understanding of Azure Virtual WAN, VPN Gateway, and Log Analytics Workspace to make informed decisions and optimize your setup for S2S troubleshooting.

- The Log Analytics Workspace can take up to 30 minutes to show logs once the diagnostic settings are created.