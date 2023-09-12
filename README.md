# Azure Virtual WAN

## Purpose

Azure Virtual WAN is a networking service provided by Microsoft Azure that allows you to create a wide-area network (WAN) topology that is optimized for Azure workloads. It simplifies the connectivity of your branch offices, remote users, and Azure resources by providing a unified and easy-to-manage network infrastructure. Azure Virtual WAN enables you to:

- **Connectivity**: Establish secure and optimized connections between your on-premises networks, Azure virtual networks, and remote users.
- **Global Reach**: Extend your network's reach across regions and continents, providing low-latency access to Azure services.
- **Traffic Optimization**: Route traffic efficiently through Azure's global network to ensure optimal performance and reliability.
- **Security**: Implement network security policies and firewall rules to protect your resources and data.
- **Simplified Management**: Use a centralized management interface to configure, monitor, and troubleshoot your WAN resources.

## Notes
- Ensure you have the necessary permissions and authentication configured to deploy the resources using this Terraform code. Additionally, follow the documentation links provided to gain a deeper understanding of Azure Virtual WAN, VPN Gateway, and Log Analytics Workspace to make informed decisions and optimize your setup for S2S troubleshooting.

- The Log Analytics Workspace can take up to 30 minutes to show logs once the diagnostic settings are created.
