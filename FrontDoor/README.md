# Traffic Manager Demo 
This template deploys 3 Azure Web Apps (static HTML page with image), in 3 different Azure Regions (WestUS, WestEU, EastAsia), as well as a Traffic Manager resource with TMProfile.

The Web Sites have a button to shutdown the Web App, simulating an app or Azure region outage, and seeing Traffic Manager redirecting the request to a different region.

(Know the redirect could take up to 30sec, as that is the default TTL of the TM Profile settings)

## Setup Instructions ##

[![Deploy to Azure](https://azuredeploy.net/deploybutton.svg)](https://azuredeploy.net/)

