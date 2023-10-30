# Install Chocolatey

# Set Chocolatey version to 1.4.0 to avoid installing .NET 4.8 Framework (which the newer 2.0 needs, but requires reboot, and blocks CustomScriptExtension

$env:chocolateyVersion = '1.4.0'

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

## updates
# allow all choco updates automatically 
choco feature enable -n allowGlobalConfirmation

# install Google Chrome
choco install googlechrome

# install Cassandra
choco install apache-cassandra

# install python 3.10
choco install python310

# install PostgreSQL
choco install postgresql15 --params '/Password:P@55w.rdP@55w.rd /Port:5433' --ia '--enable-components server,commandlinetools'

# install Anaconda Distribution (Python 3.x) 2023.9.0
choco install anaconda3

# install Neo4j Community Edition 3.5.1
choco install openjdk
choco install eclipse-standard-kepler
choco install neo4j-community

# install Podman 
choco install podman-machine
choco install podman-desktop
choco install podman-cli

$ docker desktop
choco install docker-desktop

#install Docker on Windows Server
Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/microsoft/Windows-Containers/Main/helpful_tools/Install-DockerCE/install-docker-ce.ps1" -o install-docker-ce.ps1
.\install-docker-ce.ps1
Restart-Computer


