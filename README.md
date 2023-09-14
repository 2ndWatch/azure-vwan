## Purpose

This repository contains sample Terraform code to deploy Azure Virtual WAN, Azure Firewall, and Virtual Networks (vnets) to create a secure hub-and-spoke network architecture within Azure.

### What is Azure Virtual WAN?

Azure Virtual WAN is a cloud-native networking service provided by Microsoft Azure. It serves as a central hub for a number of Azure services including Virtual Networks (vnets), site-to-site, point-to-site, Express Route and more. Azure Virtual WAN significantly reduces the overhead of managing BGP propogation, route-tables and peering connection between vnets. Azure Virtual WAN also allowing you to efficiently connect your on-premises networks, branch offices, and Azure SaaS solutions.

Azure Virtual WAN offers a range of capabilities, including global transit routing, secure connectivity options, and seamless integration with Azure services. It simplifies network management, enhances performance, and ensures secure and reliable network connectivity for your organization's workloads and resources.

### High-Level Design


### Key Benefits:

1. **Centralized Network Management:**
   - Azure Virtual WAN provides a centralized hub for managing and monitoring your network resources, simplifying network administration.

2. **Improved Connectivity and Performance:**
   - Enhance the connectivity and performance of your Azure workloads with optimized routing and global network backbone.

3. **Secure Transit Between Branches and Azure:**
   - Establish secure transit connectivity between your branch offices and Azure, ensuring data is transmitted safely over the network.

4. **High Availability:**
   - Virtual WAN offers built-in redundancy and high availability features, reducing network downtime and ensuring business continuity.

5. **Integration with Azure Services:**
   - Seamlessly connect to various Azure services, including Virtual Networks (VNets), ExpressRoute, and VPN gateways.

6. **Global Reach:**
   - Extend your network reach globally with Azure's extensive global network infrastructure.

7. **Cost Savings:**
   - Optimize network costs by leveraging Azure's efficient data transfer and routing, reducing data egress charges.

8. **SD-WAN Integration:**
   - Integrate Azure Virtual WAN with Azure Virtual WAN SD-WAN partners for enhanced branch-to-cloud connectivity and management.

9. **Scalability:**
   - Easily scale your network to accommodate growing business needs by adding branches and connections as required.

10. **Security and Compliance:**
    - Enhance network security and compliance with built-in features like Azure Firewall integration and security policies.

11. **Traffic Optimization:**
    - Efficiently route traffic through the Azure backbone for lower latency and improved application performance.

12. **Simplified Branch Connectivity:**
    - Streamline branch connectivity with a simplified setup process, reducing deployment complexity.

With Azure Virtiual WAN, you can optimze your network architecture, improve performance, and ensure secure and reliable network connectivity between your on-premises locations and Azure resources.

## Supporting Links
[Azure Virtual WAN Overview](https://learn.microsoft.com/en-us/azure/virtual-wan/virtual-wan-about)