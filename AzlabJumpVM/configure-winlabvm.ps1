# Install Chocolatey

# Set Chocolatey version to 1.4.0 to avoid installing .NET 4.8 Framework (which the newer 2.0 needs, but requires reboot, and blocks CustomScriptExtension

# Install Chrome
$workdir = $env:TEMP;
$ChromeInstaller = "chrome_installer.exe"
Invoke-WebRequest "https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7B0022FD8E-83B2-A4FB-5279-5DF9E9769D28%7D%26lang%3Den%26browser%3D3%26usagestats%3D0%26appname%3DGoogle%2520Chrome%26needsadmin%3Dprefers%26ap%3Dx64-stable-statsdef_1%26installdataindex%3Dempty/chrome/install/ChromeStandaloneSetup64.exe" -OutFile $workdir\$ChromeInstaller
Start-Process -FilePath $workdir\$ChromeInstaller -Args "/silent /install" -Verb RunAs -Wait
Write-Host "Installing Chrome Browser" -ForegroundColor Green
$env:chocolateyVersion = '1.4.0'

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

## updates
# allow all choco updates automatically 
choco feature enable -n allowGlobalConfirmation

# install Google Chrome
choco install googlechrome

# install PostgreSQL 15.4
choco install postgresql

# install Anaconda Distribution (Python 3.x) 2023.9.0
choco install anaconda3

# install Neo4j Community Edition 3.5.1
choco install neo4j-community

# install Podman Desktop 1.4.0
choco install podman-desktop
choco install podman-cli

$ docker desktop
choco install docker-desktop
