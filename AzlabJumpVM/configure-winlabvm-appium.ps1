# Install Chocolatey

# Set Chocolatey version to 1.4.0 to avoid installing .NET 4.8 Framework (which the newer 2.0 needs, but requires reboot, and blocks CustomScriptExtension

$env:chocolateyVersion = '1.4.0'

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

## updates
# allow all choco updates automatically 
choco feature enable -n allowGlobalConfirmation

# install Google Chrome
choco install googlechrome --pre=120.0.6099.110 --ignore-checksums -y #pdt fixing an issue on Jan4 with new msi package

# install Appium Server and Inspector GUI
choco install appium-desktop
