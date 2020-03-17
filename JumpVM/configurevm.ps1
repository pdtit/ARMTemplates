# Install Chocolatey Packager
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Silent Install Software Tools
# Install System Tools
# Install Microsoft Edge
choco install microsoft-edge -confirm:$false
# Install .NET Core SDK
choco install dotnetcore-sdk -confirm:$false
# Install PowerShell Core 7
choco install powershell-core -confirm:$false
# Install SQL Server Management Studio
choco install sql-server-management-studio -confirm:$false
# Install Windows Admin Center
choco install windows-admin-center -confirm:$false
# Install Windows Subsystem for Linux
choco install wsl -confirm:$false

# Install Azure Tools
# Install AZ Copy
choco install azcopy -confirm:$false
# Install Azure CLI
choco install azure-cli -confirm:$false
# Install Azure PowerShell
choco install azurepowershell -confirm:$false
# Install Azure Data Studio
choco install azure-data-studio -confirm:$false
# Install Cosmos DB Explorer
choco install cosmosdbexplorer -confirm:$false
# Install Azure Storage Explorer
choco install microsoftazurestorageexplorer -confirm:$false
# Install Service Bus Explorer
choco install servicebusexplorer -confirm:$false

# Install Additional Tools
# Install 7-Zip
choco install 7zip -confirm:$false
# Install Docker Desktop
choco install docker-desktop -confirm:$false
# Install Foxit Reader
choco install foxitreader -confirm:$false
# Install Google Chrome
choco install googlechrome -confirm:$false
# Install Marktext
choco install marktext -confirm:$false
# Install Node.js
choco install nodejs-lts -confirm:$false
# Install Notepad++
choco install notepadplusplus -confirm:$false
# Install Postman
choco install postman -confirm:$false
# Install Putty
choco install putty.install -confirm:$false

# Install Visual Studio Code Extensions
code --install-extension bencoleman.armview
code --install-extension ms-azuretools.vscode-apimanagement
code --install-extension visualstudioonlineapplicationinsights.application-insights
code --install-extension ms-kubernetes-tools.vscode-aks-tools
code --install-extension ms-azuretools.vscode-logicapps
code --install-extension ms-vsts.team
code --install-extension samcogan.arm-snippets
code --install-extension ms-vscode.vscode-node-azure-pack
code --install-extension ms-dotnettools.csharp
code --install-extension formulahendry.docker-explorer
code --install-extension ms-edgedevtools.vscode-edge-devtools
code --install-extension github.vscode-pull-request-github
code --install-extension codezombiech.gitignore
code --install-extension eamodio.gitlens
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension ms-vscode.theme-markdownkit
code --install-extension davidanson.vscode-markdownlint
code --install-extension ms-vscode.notepadplusplus-keybindings
code --install-extension ms-vscode.powershel
code --install-extension ms-python.python
code --install-extension joytrekker.rainier
code --install-extension ms-vscode-remote.remote-wsl
code --install-extension humao.rest-client
code --install-extension redhat.vscode-yaml
