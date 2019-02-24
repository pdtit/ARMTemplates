{
  "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
  },
  "variables": {
    "VNETNAME": "PDTTrainingVNET",
    "DNSIP": "10.0.1.4",
    "PDTTrainingVNETPrefix": "10.0.0.0/16",
    "PDTTrainingVNETSubnet1Name": "Apps",
    "PDTTrainingVNETSubnet1Prefix": "10.0.0.0/24",
    "PDTTrainingVNETSubnet2Name": "Identity",
    "PDTTrainingVNETSubnet2Prefix": "10.0.1.0/24"
  },

  "resources": [
    {
      "name": "PDTTrainingVNET",
      "type": "Microsoft.Network/virtualNetworks",
      "location": "[resourceGroup().location]",
      "apiVersion": "2016-03-30",
      "dependsOn": [],
      "tags": {
        "displayName": "PDTTrainingVNET"
      },
      "properties": {
        "addressSpace": {
          "addressPrefixes": [
            "[variables('PDTTrainingVNETPrefix')]"
          ]
        },
        "subnets": [
          {
            "name": "[variables('PDTTrainingVNETSubnet1Name')]",
            "properties": {
              "addressPrefix": "[variables('PDTTrainingVNETSubnet1Prefix')]"
            }
          },
          {
            "name": "[variables('PDTTrainingVNETSubnet2Name')]",
            "properties": {
              "addressPrefix": "[variables('PDTTrainingVNETSubnet2Prefix')]"
            }
          }
        ]
      }
    }
  ],
  "outputs": {}

  }