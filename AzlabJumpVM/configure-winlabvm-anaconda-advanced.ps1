# Install Chocolatey

# Set Chocolatey version to 1.4.0 to avoid installing .NET 4.8 Framework (which the newer 2.0 needs, but requires reboot, and blocks CustomScriptExtension

$env:chocolateyVersion = '1.4.0'

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

## updates
# allow all choco updates automatically 
choco feature enable -n allowGlobalConfirmation

# install Google Chrome
choco install googlechrome

# install Anaconda Distribution (Python 3.x) 2023.9.0
choco install anaconda3

# install Python 3.6
choco install python36

# install PostgreSQL - NOT USED FOR NOW SINCE THE PASSWORD PARAMETER IS NOT RECOGNIZED
# choco install postgresql --params '/password:P@55w.rdP@55w.rd' --ia '--enable-components server,commandlinetools'

# install PGAdmin
choco install pgadmin4

# install PostgreSQL using silent install
# Download the installer
$installerUrl = "https://get.enterprisedb.com/postgresql/postgresql-16.0-1-windows-x64.exe"
$installerPath = "C:\Temp\postgresql-16.0-1-windows-x64.exe"
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Run the installer
$superPassword = "P@55w.rdP@55w.rd"
$serviceName = "PostgreSQL"
$servicePort = 5432
& $installerPath --mode unattended --superpassword $superPassword --servicename $serviceName --serverport $servicePort

# install Visual Studio 2019 Build tools
choco install visualstudio2019buildtools

Restart-Computer