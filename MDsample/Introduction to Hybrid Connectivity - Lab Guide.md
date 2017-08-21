Introduction to Azure Virtual Network Connectivity
==================================================

LAB GUIDE
---------

| Conditions and Terms of Use                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| This training package is proprietary and confidential. Duplicating, reselling and/or distribution of course materials in their entirety or in part is not permitted without the expressed prior written consent of Opsgility, LLC. The contents of this package are for informational and training purposes only and are provided "as is" without warranty of any kind, whether express or implied, including but not limited to the implied warranties of merchantability, fitness for a particular purpose, and non-infringement. Training package content, including URLs and other Internet Web site references, is subject to change without notice. Because Opsgility must respond to changing market conditions, the content should not be interpreted to be a commitment on the part of Opsgility, and Opsgility does not guarantee the accuracy of any information presented after the date of release, publication or delivery of training sessions.  |

Lab Overview
============

In this lab, you will create 3 virtual networks in two different regions. You
will configure site-to-site connectivity between the regions using a VPN
Gateway. You will next configure a client machine (the lab virtual machine) to
connect to one of the virtual networks using point-to-site connectivity.
Finally, you will configure virtual network to virtual network connectivity
using virtual network peering. This will also allow traffic from the 3rd virtual
network to transit over the VPN gateway.

Learning Objectives
-------------------

-   Understand how to connect virtual networks across Azure regions using
    site-to-site VPN

-   Configure point-to-site connectivity for individual client machines to
    access resources in a virtual network securely

-   Configure virtual network peering between two virtual networks in the same
    region and allow traffic to transit over the gateway

What you will Build
-------------------

![](media/f78f24333e38459ee61d772c0b37ba3b.png)

Time Estimate
-------------

2 to 3 hours

Exercise 1: Create a VM in a Virtual Network 
=============================================

Overview
--------

In this exercise, you will create a virtual machine and a virtual network in a
region. This virtual network and virtual machine will be used as the source to
connect to a virtual machine and virtual network in a remote region.

Time Estimate
-------------

30 minutes

Task 1: Login to the Azure Management Portal
--------------------------------------------

1.  From within the RDP session (**LABVM**), open Internet Explorer and navigate
    to <https://portal.azure.com> and authenticate with your Organization or
    Microsoft Account by selected the correct link.

>   [./media/image2.png](./media/image2.png)

Task 2: Create an Azure Virtual Network
---------------------------------------

1.  Click **New**, **Networking**, and then click **Virtual Network**.

    ![](media/c253398f81ace5e27b897fcb6b03bd67.png)

2.  Leave the deployment model at **Resource Manager** and click **Create**.

    ![](media/9904856ea98b87e5f42e261ce1b8997c.png)

3.  Specify the following configuration:

| Name: **OpsVirtualNetwork1** | [./media/image5.png](./media/image5.png) |
|------------------------------|------------------------------------------|


-   Address space: **10.0.0.0/16**

-   Subnet name: **Apps**

-   Subnet address range: **10.0.0.0/24**

-   Resource Group: **OpsVNETRmRG**

-   Location: **Select a region different than the one you used for the lab
    virtual machine.**

You may see a warning like this when creating the virtual network. This is just
letting you know that you cannot connect these two virtual networks later using
a site-to-site or ExpressRoute connection because the address range overlaps.
You can ignore this warning.

1.  Check the box **Pin to dashboard** and click **Create** to create the
    virtual network.

    ![](media/62e5378b3097c65476aa11673038961f.png)

Task 3: Add a New Subnet
------------------------

In this task, you will learn how to add an additional subnet to the virtual
network.

1.  After the virtual network is created, click the **Subnets** link under
    **SETTINGS**.

    ![](media/d03811580c403f169098b87abc050bfd.png)

2.  Click **Subnet +**

    ![](media/9651b02dea8470275a2805bd4c49e05c.png)

3.  Specify the following configuration on the new subnet and click **OK**.

    1.  Name: **Data**

    2.  Address Space: **10.0.1.0/24**

        ![](media/3706747d18b463c9b44550e88567eea5.png)

        You should have two subnets with following address ranges:

        ![](media/be2091e8bccfb4d9011787440c557a9c.png)

Task 4: Create a Virtual Machine in the Virtual Network
-------------------------------------------------------

In this task, you will create a virtual machine in the virtual network and
specify the subnet it will be deployed to.

1.  Click **New**, **Compute**, and then select the **Windows Server 2016
    Datacenter** image from the FEATURED APPS list.

    ![](media/82427cedf8ba29837949ca01c6619c38.png)

2.  Leave the deployment model set to **Resource Manager** and click **Create**.

    ![](media/74ba2b5f0859fffac881bde1a7d9e962.png)

3.  Specify the following configuration and click **OK**.

| Name: **VNET1VM** | [./media/image13.png](./media/image13.png) |
|-------------------|--------------------------------------------|


-   VM disk type: **SDD**

-   User name: **demouser**

-   Password: **demo\@pass123**

-   Subscription: **Ensure the correct subscription is selected**

-   Resource Group: **OpsVMRmRG**

-   Location: **the same region selected for the Azure Virtual Network**

1.  Choose **DS1_V2** and then click **Select** at the bottom of the page.

Note: You may have to click View All to see this option.

![](media/8d67f40c1f886d59b38f5efc88b066f7.png)

1.  Click Configure required settings to specify a storage account for your
    virtual machine.

Note: You could optionally select Use managed disks instead, if that feature is
available in your region.

>   [./media/image15.png](./media/image15.png)

1.  Click **+ Add.**

>   [./media/image16.png](./media/image16.png)

1.  Specify a unique name for the storage account (all lower letters and
    alphanumeric characters) and ensure the green checkmark shows the name is
    valid.

    ![](media/013bbbe3abcb025f12354a067a12ce04.png)

2.  Click **OK** to continue.

>   [./media/image18.png](./media/image18.png)

1.  Click Configure required settings for the Diagnostics storage account.
    Repeat the same steps to select a unique storage account name. This storage
    account will hold diagnostic logs about your virtual machine that you can
    use for troubleshooting purposes.

>   [./media/image19.png](./media/image19.png)

1.  Specify the following configuration options:

    -   Virtual network: Click the Virtual Network tile to change it to
        **OPSVirtualNetwork1** (if it is not already selected).

    -   Subnet: Click the Subnet tile to change it to the **Apps** subnet (if it
        is not already selected)

        ![](media/c317dbc76c280bddaa712f50235a375d.png)

2.  Click **OK** until all blades are closed and the virtual machine starts to
    provision.

Summary
-------

In this exercise, you created a virtual network that will be used for several of
the hands on labs in this course. You then created a virtual machine and
specified the virtual network configuration and the availability set for the
virtual machine.

Exercise 2: Connecting Azure Regions
====================================

Overview
--------

In this exercise, you will create a new virtual network in a second region and
establish connectivity between the regions using a site-to-site virtual private
network (VPN).

Time Estimate
-------------

90 minutes

Task 1: Create the Remote Virtual Network
-----------------------------------------

In this task, you will create a virtual network in a second Azure region.

1.  Using the Azure Management Portal, click **New**, **Networking**, and
    **Virtual network**.

    ![](media/5b136b0e4b1b336b37c19d45ee4e588f.png)

2.  Accept the default value of **Resource Manager**, and click **Create**.

    ![](media/f939cfcd60a5baa2d6fd83e8e29a4f49.png)

3.  Specify the following configuration:

| Name: **OpsVirtualNetwork2** | [./media/image23.png](./media/image23.png) |
|------------------------------|--------------------------------------------|


-   Address space: **10.10.0.0/16**

-   Subnet name: **Apps**

-   Subnet address range: **10.10.0.0/24**

-   Subscription: **Choose your Subscription**

-   Resource Group: **OpsVNETRemoteRG**

-   Location: **Specify a remote region from the region you are currently
    using.**

**Make sure this is NOT the same location you have specified in the previous
labs.**

1.  Check **Pin to dashboard,** and then click **Create** to create the new
    virtual network.

    ![](media/62e5378b3097c65476aa11673038961f.png)

Task 2: Configure Subnet Gateways for both virtual networks
-----------------------------------------------------------

In this task, you will add additional subnets to the virtual networks. Each
virtual network will require a gateway for VPN connectivity. The VPN Gateway
requires its own subnet to allocate addresses from.

1.  On the **OpsVirtualNetwork2** virtual network configuration blade, click
    **Subnets** and then click **+Gateway subnet**.

    ![C:\\Users\\MICHAE\~1\\AppData\\Local\\Temp\\SNAGHTML41c7f54.PNG](media/0e148833a7a8bed3901f1f68df7af156.png)

2.  Specify the following configuration for the subnet and click **OK**.

    -   Name: **GatewaySubnet**

    -   Address range: **10.10.1.0/29**

        ![](media/5686a44de9a3b046c880cb2e84aeae4a.png)

3.  Open the **OpsVirtualNetwork1** configuration blade by clicking **More
    services**, **Virtual Networks**, and clicking on **OpsVirtualNetwork1**.

4.  On the **OpsVirtualNetwork1** virtual network configuration blade, click
    **Subnets** and then click **+Gateway subnet**.

    ![C:\\Users\\MICHAE\~1\\AppData\\Local\\Temp\\SNAGHTML41fd100.PNG](media/1a81ebb35db14102b666a690823cbcfd.png)

5.  Specify the following configuration and click **OK.**

    -   Name: **GatewaySubnet**

    -   Address range: **10.0.2.0/29**

        ![](media/0d881296e1e3877f5f60c03363b11f8f.png)

Task 3: Create the First Gateway
--------------------------------

In this task, you will create the VPN gateway for the first virtual network.

1.  Using the Azure Management Portal, click **More services**, **Virtual
    Network Gateways**.

2.  Click the **Add** button on the toolbar.

    ![](media/6bb5b68754d7bf4529312118af78bd11.png)

3.  Name the gateway **OPSGW1**.

    ![](media/8e5005f2d2438116d4975d44f34f988a.png)

4.  Select the region the **OpsVirtualNetwork1** is deployed to.

    ![](media/6458a3110ea6c5328dc6e7fbd4b44fe6.png)

5.  Click the **Choose a virtual network tile**, and select
    **OpsVirtualNetwork1**.

    ![C:\\Users\\MICHAE\~1\\AppData\\Local\\Temp\\SNAGHTML43aa624.PNG](media/65e9a35882f0318938c43766cc25f139.png)

6.  Click the **Public IP address** tile, and click **Create new**.

    ![C:\\Users\\MICHAE\~1\\AppData\\Local\\Temp\\SNAGHTML43c236d.PNG](media/35b5544ac8dc96e0410ac33cfc3aa8e1.png)

7.  Name the IP **OPSGW1IP** and click **OK**.

    ![](media/51d34c3a2c3fe31dcfc328a73c0cde1c.png)

8.  Click the **Create** button at the bottom of the blade to start the
    provisioning of the gateway.

Task 4: Create the Second Gateway
---------------------------------

In this task, you will create the second VPN Gateway.

1.  Using the Azure Management Portal, click **More services**, **Virtual
    Network Gateways**.

2.  Click the **Add** button on the toolbar.

    ![](media/6bb5b68754d7bf4529312118af78bd11.png)

3.  Name the gateway **OPSGW2**.

    ![](media/1200e4b1535363af927ddbcba3f2f833.png)

4.  Select the region the **OpsVirtualNetwork2**is deployed to.

    ![](media/7a3d431cd3611bbb5b0c27f64043f89f.png)

5.  Click **Choose a virtual network**, and select **OpsVirtualNetwork2**.

    ![](media/b5ed45c4b2d020f58f4d5d1223c294ed.png)

6.  Click the **Public IP address** tile, and click **Create new**.

    ![](media/eb023d7de6640226eac85c1cef32a84c.png)

7.  Name the IP **OPSGW2IP** and click **OK**.

    ![](media/21865fff01087bf44d7d9050e3c8f54e.png)

8.  Click the **Create** button at the bottom of the blade to start the
    provisioning of the gateway.

Note: It may take up to 60 minutes to provision both gateways. At this point you
should come back and continue the lab after the gateways are provisioned.

1.  The Azure Portal will notify you when the deployments have completed.

    ![](media/a33312bb97cc22a7eda1aa33f155c5fd.png)

Proceed through Exercise 5 while waiting on the gateways to be provisioned.

Task 5: Create a VM to Validate Connectivity
--------------------------------------------

In this task, you will create a virtual machine in the second virtual network
that will be used to test connectivity across the VPN tunnel.

1.  Create a new Virtual Machine in the second virtual network by clicking
    **New**, **Virtual Machines**, and **Windows Server 2016 Datacenter**.

    ![](media/82427cedf8ba29837949ca01c6619c38.png)

2.  Accept the default setting of **Resource Manager** and then click
    **Create**.

    ![](media/5f2b992921def69ab94cf2318a3c7216.png)

3.  Specify the following configuration, and click **OK**.

| Name: **VNET2VM** | [./media/image41.png](./media/image41.png) |
|-------------------|--------------------------------------------|


-   VM disk type: **SSD**

-   User name: **demouser**

-   Password: **demo\@pass123**

-   Resource Group: **OpsVMRmRG**

-   Location: **the region you created the OpsVirtualNetwork2 virtual network
    in.**

1.  Choose **DS1_V2 Standard** and click **Select**.

>   [./media/image42.png](./media/image42.png)

1.  Click Configure required settings to specify a storage account for your
    virtual machine.

Note: You could optionally select Use managed disks instead, if that feature is
available in your region.

>   [./media/image15.png](./media/image15.png)

1.  Click **+ Add.**

>   [./media/image16.png](./media/image16.png)

1.  Specify a unique name for the storage account (all lower letters and
    alphanumeric characters) and ensure the green checkmark shows the name is
    valid.

    ![](media/013bbbe3abcb025f12354a067a12ce04.png)

2.  Click **OK** to continue.

>   [./media/image18.png](./media/image18.png)

1.  Click Configure required settings for the Diagnostics storage account.
    Repeat the same steps to select a unique storage account name. This storage
    account will hold diagnostic logs about your virtual machine that you can
    use for troubleshooting purposes.

>   [./media/image19.png](./media/image19.png)

1.  On the Settings blade, change the Virtual network to **OpsVirtualNetwork2**,
    and set the subnet to the default subnet named: **default**.

    ![](media/54fc2cca91c1d8c25dea77b7c7ac447d.png)

2.  Click **OK**, and then click **OK** again to provision the virtual machine.

Task 6: Connect the Gateways
----------------------------

In this task, you will connect the gateways and establish the VPN tunnel.

1.  Check the notifications area first to ensure both gateways are provisioned
    prior to continuing.

    ![](media/bda4533f8a993c26ae798598b6289ea3.png)

2.  Using the Azure Management Portal, click **New**, and type in
    **Connection**, and press **enter**.

    ![](media/80cbef72c2a6192d56585f7f2a8c31ee.png)

3.  Click **Connection**, and then click **Create**.

    ![](media/5c7fe10f3fd5610a57f9ca84063e15eb.png)

4.  Select the existing **OpsVMRmRG** resource group. Then **change the
    location** of this connection to the Azure region the **OpsVirtualNetwork1**
    virtual network is deployed to. Click **OK**.

    ![](media/4430f9019b46ecec1d9caedb6a2c6b9b.png)

5.  On the Settings tab, select **OPSGW1** for the first virtual network
    gateway, and **OPSGW2** for the second virtual network gateway. Enter the
    shared key: **A1B2C3D4**, and click **OK**.

    ![](media/4014e00b9d7a577520f37f22fe572804.png)

6.  Click **OK** on the Summary page to create the connection.

7.  Using the Azure Management Portal, click **More services, Connections.**
    Watch the progress of the connection status and use the **Refresh** icon
    until the status changes for both connections from **Updating** to
    **Succeeded** and then **Unknown** to **Connected**.

    ![](media/d156f341a7c4296dbc094c35464113e6.png)

Task 7: Validate Connectivity 
------------------------------

In this task, you will connect to a virtual machine in the second virtual
network from a virtual machine in the first virtual network using a private IP
address. This will validate that the virtual networks are connected using the
VPN connection.

1.  Click on **More services**, **Virtual Machines** and click the new virtual
    machine **VNET2VM**.

    ![](media/9f70fbaf3c799f098dc2777ebb2e2d4f.png)

2.  Click the **Network Interfaces** link beneath SETTINGS.

    ![](media/09779633054c774896aa7dd16c0801e8.png)

3.  Copy the private IP address to the clipboard or paste it to a notepad for
    later reference, this IP will be used to connect from the first virtual
    machine.

    ![](media/2fb1ccf9eb68e8286eb703154d47841c.png)

4.  Click on **More services**, **Virtual Machines**, and click on the
    **VNET1VM** virtual machine.

    ![](media/d611011a48a692279d5783e1b204f51d.png)

5.  Click on **Connect,** and login using the credentials specified when
    creating the virtual machine:

    1.  User name: **demouser**

    2.  Password: **demo\@pass123**

        ![](media/daf130296e8cb7d0d167190bc16eda96.png)

        ![](media/1efddd9c821f06c7c8da66100789035e.png)

6.  From within **VNET1VM**, click the Windows icon and then click the Remote
    Desktop icon.

    ![](media/a0610c02e51b5fbafc945c83e1eaa9c5.png)

    ![](media/7690a55c40ffce714ffd558254c7eec4.png)

7.  Specify the private IP for **VNET2VM** and click **Connect**. Enter the
    credentials for the virtual machine when prompted:

    1.  User name: **demouser**

    2.  Password: **demo\@pass123**

        ![](media/0b99369c984cea8b8ff1aafaf7d56256.png)

Connecting to the virtual machine validates that the tunnel is working correctly
and you are connecting over the VPN tunnel between sites.

Summary
-------

In this exercise, you created a new virtual network in a remote region and
established connectivity between the regions using a site-to-site virtual
private network (VPN).

Exercise 3: Configuring Point-to-Site
=====================================

Overview
--------

In this exercise, you will configure your lab virtual machine to connect to a
virtual network using a point-to-site connection. This scenario is ideal for
requirements that require an individual computer to connect securely over the
Internet to resources running in an Azure Virtual Network.

Time Estimate
-------------

30 minutes

1.  Launch a command prompt from within the **LABVM** virtual machine and then
    execute the following commands:

CD C:\\

MKDIR OpsgilityTraining

CD OpsgilityTraining

![](media/c15a46d4c6969a349ec5b0e0626a1cb5.png)

1.  Download the student files zip from the lab guide in
    [www.opsgility.com](http://www.opsgility.com) to the
    **C:\\OpsgilityTraining** folder. Extract the contents to the same folder.

    ![](media/84926745a270ceb198a15158407153f3.png)

    ![](media/239c79a56fc35496245e1655a7af595d.png)

2.  Execute the following command to generate a root certificate for configuring
    a point-to-site VPN gateway.

makecert -sky exchange -r -n "CN=P2SROOT" -pe -a sha1 -len 2048 -ss My
.\\P2SRoot.cer

![](media/855d517e61d1b5a599a75b39390d8409.png)

1.  Execute the following command to generate a client certificate:

makecert.exe -n "CN=P2SClient" -pe -sky exchange -m 96 -ss My -in "P2SRoot" -is
my -a sha1

1.  Using **File Explorer**, navigate to the **C:\\OpsgilityTraining** folder
    and double-click the **P2SRoot.cer** file.

    ![](media/dfcb4aa764cc79044863c407cd07d5c9.png)

2.  Click the **Details** tab of the certificate.

    ![](media/6f09dd0f53c834899f9801bf7a8491ef.png)

3.  Click **Copy to File**

    ![](media/15979b0218122fb5a2406a64e79a6cf9.png)

4.  Click **Next**, then change the encoding type to **Base-64 encoded X.509
    (.CER)** and click **Next**.

    ![](media/a004efb52c78f4908d96e6beddf99df6.png)

5.  Specify the filename as **C:\\OpsgilityTraining\\PublicKeyFile.** Click
    **Next** and **Finish**.

    ![](media/154327e86650ff8e74bdeb04e2457194.png)

Task 1: Configure the VPN gateway 
----------------------------------

In this exercise, you will execute a PowerShell script that uses the Azure
PowerShell cmdlets to configure the VPN Gateway for client connectivity by
adding an additional address space. This script will also upload a certificate
that you will create in the exercise, and finally it will generate a VPNClient
package that you can then install on your client computer (along with the
certificate) to use point-to-site.

1.  Using File Explorer, right click on the **Configure-Point-to-Site.ps1**
    PowerShell script and click **Edit**.

2.  Review the comments in the PowerShell code to understand what it is doing.

3.  Open the file **C:\\OpsgilityTraining\\PublicKeyFile.cer** created earlier
    in notepad.

4.  Copy ALL of the values between “-----BEGIN CERTIFICATE-----“ and “-----END
    CERTIFICATE-----“ to the clipboard.

    ![](media/acfca25e7f6da73fdbaee24466bff18b.png)

5.  Within the PowerShell ISE identify the following code and replace the entre
    value between quotes with the copied data.

    ![](media/89737c40d265045ccbfbd3d7676fd0ee.png)

    ![](media/82ab4e979d037c8466f719864ade49f6.png)

6.  In the Console Pane of the PowerShell ISE execute the following command to
    login to Azure from PowerShell. When prompted login with the credentials for
    your Azure subscription.

Login-AzureRmAccount

1.  If your credentials are associated with multiple subscriptions, you can
    switch subscriptions by using the **Get-AzureRmSubscription** cmdlet to
    retrieve the Subscription ID and then use the **Select-AzureRmSubscription**
    cmdlet to select the subscription where your virtual network is created at.

    Example of multiple subscriptions:

    ![](media/f254a2c7933c59f60c94232674db4af8.png)

    Example of selecting a subscription:

    ![](media/9825697b2262e17692b63bdccfbf2ea0.png)

2.  Click the Green Arrow to execute the script.

    ![](media/151ed3a477bbb0324415280b11dee089.png)

3.  After the script executes run the following command to install the VPN
    client.

    ![](media/f19dc102d8eb3ff029230f9a8e436028.png)

Note: The makecert.exe commands used earlier automatically install the client
certificate on the lab machine. To do this on a separate machine you would need
to create a new client certificate, export, and install the certificate on the
machine in addition to the VPNClient.exe install.

Task 2: Validate Client Connectivity with Point-to-Site
-------------------------------------------------------

In this task, you will validate that you can connect from the lab machine to the
virtual network using private IP addresses.

1.  The client computer should now have a new connection option in the same
    location as new wireless connections. Click the **OPSVirtualNetwork1** icon
    to launch the connection.

    ![](media/8798bb686e2fd341956bdf2aa5120e2a.png)

2.  On the Setting Menu click **OpsVirtualNetwork1**, then click **Connect** to
    initiate connection.

    ![](media/0e6e1d34a62f48f9d814eae36cb570db.png)

3.  On the Windows Azure, Virtual Network dialog box, click **Connect**.

    ![](media/b5bec22ac2942bb486f77bf6a008d451.png)

4.  If you receive a message requesting elevated privilege to run, Select **Do
    not show this message again for this Connection** and click **Continue** and
    then click **Connect** again.

    ![](media/743cca31d7d777b9ba97472e127449e4.png)

NOTE: The dialog box will disappear when the connection is completed.

1.  Click again in the connections are of the LABVM, and note the machine is in
    the “Connected” state.

    ![](media/51feed0bc3221995ac3da0d27757e6ed.png)

2.  From within **LABVM**, click the Windows icon and then click the Remote
    Desktop icon.

    ![](media/a0610c02e51b5fbafc945c83e1eaa9c5.png)

    ![](media/6e48ee8c314d944720bdbaa239e09bc4.png)

3.  In the remote desktop client, enter the IP address **10.0.0.4** to connect
    to the virtual machine’s private IP address. If you are prompted to login
    after clicking **Connect** you have validate private connectivity using the
    point-to-site connection.

    ![](media/b7c4d158a2d5ae345e333efd0631b8ea.png)

Summary
-------

In this exercise, you have configured your lab virtual machine to connect to a
virtual network using a point-to-site connection.

Exercise 4: Configuring Virtual Network Peering
===============================================

Overview
--------

In this exercise, you will create a new virtual network in the same region as
the second virtual network and configure direct peering for connectivity.

Time Estimate
-------------

30 minutes

Task 1: Create the Virtual Network
----------------------------------

In this task, you will create a third virtual network in the same region as the
second.

1.  Using the Azure Management Portal, click **New**, **Networking**, and
    **Virtual network**.

    ![](media/5b136b0e4b1b336b37c19d45ee4e588f.png)

2.  Accept the default value of **Resource Manager**, and click **Create**.

    ![](media/f939cfcd60a5baa2d6fd83e8e29a4f49.png)

3.  Specify the following configuration:

| Name: **OpsVirtualNetwork3** | [./media/image82.png](./media/image82.png) |
|------------------------------|--------------------------------------------|


-   Address space: **10.20.0.0/16**

-   Subnet address range: **10.20.0.0/24**

-   Subscription: **Choose your Subscription**

-   Resource Group: **OpsVNETRemoteRG**

-   Location: **Specify the same region as OpsVirtualNetwork2.**

1.  Check **Pin to dashboard,** and then click **Create** to create the new
    virtual network.

    ![](media/62e5378b3097c65476aa11673038961f.png)

Task 2: Allow Gateway Transit
-----------------------------

In this task, you will configure the gateway for OpsVirtualNetwork2 to allow
traffic from OpsVirtualNetwork3 to flow (transit) over its gateway.

1.  Open the configuration for **OpsVirtualNetwork2** by clicking **More
    services**, **Virtual Networks**.

2.  After the virtual network, has provisioned, click the **Peerings** link
    under **SETTINGS**.

    ![](media/7845e0aaeaf8df90efcf88903771ad75.png)

3.  Click the **+ Add** button.

    ![](media/4a5f3bbd5374efd2f2138c30febe9395.png)

4.  Specify the name **OPSVNET2Peering**, and select the **OPSVirtualNetwork3**
    virtual network.

    ![](media/b10d38ecae39a9fa351d17b0a85ca64e.png)

5.  Check the boxes for **Allow forwarded traffic** and **Allow gateway
    transit** and click **OK**.

    ![](media/654d00dad6bcb83a937b68378eceb128.png)

**Allow forwarded traffic:** This setting allows the peer’s forwarded traffic
(traffic not originating from inside the peer virtual network) into your virtual
network.

**Allow Gateway transit:** Allows the peer virtual network to use your virtual
network gateway. The peer virtual network cannot already have a gateway
configured, and must select ‘use remote gateway’ in its peering settings.

1.  Open the configuration for **OpsVirtualNetwork3** by clicking **More
    services**, **Virtual Networks**.

2.  Click the **Peerings** link under **SETTINGS**.

    ![](media/7845e0aaeaf8df90efcf88903771ad75.png)

3.  Click the **+ Add** button.

    ![](media/4a5f3bbd5374efd2f2138c30febe9395.png)

4.  Specify the name as OPSVNET2Peering, and select the OpsVirtualNetwork2
    virtual network as the peer.

    ![](media/c30ee05e91534c892cd065f643e033da.png)

5.  Check the **Allow forwarded traffic** and **Use remote gateways** checkboxes
    and click **OK**.

    ![](media/bd3d8bde3c7876141003a44de1f61ea1.png)

**Use remote gateways:** this setting allows the virtual network to forward
traffic using the peered virtual networks gateway.

Task 3: Create a VM to Validate Connectivity
--------------------------------------------

In this task, you will deploy another virtual machine to validate connectivity
from the third subnet using peering and VPN Gateway transit traffic.

1.  Create a new Virtual Machine in the second virtual network by clicking
    **New**, **Virtual Machines**, and **Windows Server 2016 Datacenter**.

    ![](media/82427cedf8ba29837949ca01c6619c38.png)

2.  Accept the default setting of **Resource Manager** and then click
    **Create**.

    ![](media/5f2b992921def69ab94cf2318a3c7216.png)

3.  Specify the following configuration, and click **OK**.

| Name: **VNET3VM** | [./media/image89.png](./media/image89.png) |
|-------------------|--------------------------------------------|


-   VM disk type: **SSD**

-   User name: **demouser**

-   Password: **demo\@pass123**

-   Resource Group: **OpsVMRmRG**

-   Location: **the region you created the OpsVirtualNetwork3 virtual network
    in.**

1.  Choose **DS1_V2 Standard** and click **Select**.

>   [./media/image42.png](./media/image42.png)

1.  Click Configure required settings to specify a storage account for your
    virtual machine.

Note: You could optionally select Use managed disks instead, if that feature is
available in your region.

>   [./media/image15.png](./media/image15.png)

1.  Click **+ Add.**

>   [./media/image16.png](./media/image16.png)

1.  Specify a unique name for the storage account (all lower letters and
    alphanumeric characters) and ensure the green checkmark shows the name is
    valid.

    ![](media/013bbbe3abcb025f12354a067a12ce04.png)

2.  Click **OK** to continue.

>   [./media/image18.png](./media/image18.png)

1.  Click Configure required settings for the Diagnostics storage account.
    Repeat the same steps to select a unique storage account name. This storage
    account will hold diagnostic logs about your virtual machine that you can
    use for troubleshooting purposes.

>   [./media/image19.png](./media/image19.png)

1.  On the Settings blade, change the Virtual network to **OpsVirtualNetwork3**,
    and set the subnet to the default subnet named: **default**.

    ![](media/6d799971a8af07aad2f16dded0a59e63.png)

2.  Click **OK**, and then click **OK** again to provision the virtual machine.

3.  After the virtual machine is provisioned, click the Connect button and login
    using the following credentials:

    1.  User name: **demouser**

    2.  Password: **demo\@pass123**

4.  Launch the remote desktop client and attempt to connect to the virtual
    machine in the remote region (**OpsVirtualNetwork1**).

    1.  10.0.0.4 – **VNET1VM** (traffic will flow over the site-to-site through
        the peer)

Exercise 5: Free Resources in your Subscription
===============================================

In this exercise, you will delete the resource groups for the resources you
created in this lab. This will delete all the artifacts created in Azure for
this lab.

Time Estimate
-------------

5 minutes

1.  In the Azure Management portal, click **Resource Groups**.

    ![](media/2d1ea931b5dac281e435809806db95ec.png)

2.  Open the **OpsVMRmRG** resource group.

    ![](media/b24a3559a09eaa5b58c7872ae6f1ed48.png)

3.  Click the **Delete** button to delete the resource group. When prompted type
    in the name of the resource group to confirm.

    ![](media/385f836b0dd77c7d454136ac3bb57e2f.png)

4.  Repeat the process for the following resource groups (in order):

    1.  OpsVNETRemoteRG

    2.  OpsVNETRmRG

    3.  OPSLABRG
