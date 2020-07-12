# JumpVM - Windows 2019 Server with Visual Studio 2019 

This template deploys a single Azure Virtual Machine, running the following:

# Settings
- local admin: Student
- local admin password: Pa55w.rd1234
- Azure VNET: jumpVMVNet (10.110.0.0./16)
- Subnet: SubNet (10.110.0.0/24)
- Public IP: jumpvmip (basic / dynamic)

# Operating System and core tools
- Operating System Windows Server 2019 Datacenter (1809)
- Visual Studio 2019 Community Edition - latest version
- Microsoft Edge browser 
- Google Chrome browser

# Azure tools
- azure-cli 
- azurepowershell 

# AZ-500 Lab10 tools
- sql-server-management-studio 

**Note: the JumpVM deployment takes +/- 15 minutes in total**

## Setup Instructions ##

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fpdtit%2FARMTemplates%2Fmaster%2FAZ-500-Lab10VM%2Fazuredeploy.json)

You can use the "Deploy to Azure" button to have this AZ-500 LabVM deployed into your Azure subscription right away. 

Another option is deploying this template from the Azure Portal, using the following steps:
1. Create New Resource
2. type "Template Deployment" in the Search Marketplace field
3. choose Build your own template in the editor
4. open the "azuredeploy.json" in raw format in GitHub 
5. Copy / Paste the content of the template file into the Azure portal - Template editor
6. Accept the default values or replace with your own choices

# Azure Bastion - Optional deployment

If your corporate network is blocking firewall port 3389 - Remote Desktop, you can use Azure Bastion; this service deploys a Bastion host into a separate SubNet in the same VNet as the AZ-500 LabVM (assuming you accept the default values), allowing for RDP tunneling over HTML5, by which you can remotely connect to the VM desktop, directly from your browser.

To deploy this template, repeat the above steps for the "bastion-template.json" ARM template, or use the below button to deploy right away.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fpdtit%2FARMTemplates%2Fmaster%2FAZ-500-Lab10VM%2Fbastion-template.json)

** Note: the Azure Bastion deployment can only succeed after the JumpVM deployment is completed successfully.**