# Install Chocolatey

# Set Chocolatey version to 1.4.0 to avoid installing .NET 4.8 Framework (which the newer 2.0 needs, but requires reboot, and blocks CustomScriptExtension

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

#install Docker on Windows Server
Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
Install-Package -Name docker -ProviderName DockerMsftProvider
Restart-Computer

$ docker desktop
choco install docker-desktop
