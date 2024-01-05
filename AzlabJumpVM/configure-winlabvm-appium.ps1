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
choco install appium-desktop ##pdt might not be supported anymore, preferably use commandline

# install NodeJS as requirement for NPM
choco install nodejs

# create labadmin user folder 
mkdir C:\Users\labadmin

# add NodeJS to path Env Variable
[Environment]::SetEnvironmentVariable("PATH", $Env:PATH + ";C:\Program Files\NodeJS\", [EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable("PATH", $Env:PATH + ";C:\Users\labadmin\AppData\Roaming\npm\", [EnvironmentVariableTarget]::Machine)


#switch to NodeJS for NPM runtime and install appium
cd "C:\Program Files\NodeJS"
npm i -g appium 

