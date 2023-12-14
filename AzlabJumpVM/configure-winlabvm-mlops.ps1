# Install Chocolatey

# Set Chocolatey version to 1.4.0 to avoid installing .NET 4.8 Framework (which the newer 2.0 needs, but requires reboot, and blocks CustomScriptExtension

$env:chocolateyVersion = '1.4.0'

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

## updates
# allow all choco updates automatically 
choco feature enable -n allowGlobalConfirmation

# install Google Chrome
choco install googlechrome

#install VSCode
choco install vscode

# install Git
choco install git

# install Anaconda Distribution (Python 3.x) 2023.9.0
# choco install anaconda3

# install Python latest version
choco install python

# install Visual Studio 2022 Build tools
choco install visualstudio2022buildtools
choco install microsoft-visual-cpp-build-tools  #required for python 13.1 and pip install for az cli

# install Azure CLI 2.54.0 through pip
# choco install azure-cli
pip install azure-cli
az extension add --name ml -y




Restart-Computer
