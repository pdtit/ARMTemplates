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
# choco install appium-desktop ##pdt version not supported by Appium anymore, preferably use commandline

# install Oracle JDK
# choco install oraclejdk
choco install openjdk11

# install NodeJS as requirement for NPM
choco install nodejs

# install Maven
choco install maven
[Environment]::SetEnvironmentVariable("PATH", $Env:PATH + ";C:\ProgramData\chocolatey\lib\maven\apache-maven-3.9.6\bin", [EnvironmentVariableTarget]::Machine)

# install Eclipse
choco install eclipse

# install npm
npm i -g npm 

# add NodeJS to path Env Variable
[Environment]::SetEnvironmentVariable("PATH", $Env:PATH + ";C:\Program Files\NodeJS\", [EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable("PATH", $Env:PATH + ";%USERPROFILE%\AppData\Roaming\npm", [EnvironmentVariableTarget]::Machine)

#switch to NodeJS for NPM runtime and install appium
cd "C:\Program Files\NodeJS"
npm i -g appium 

# Install Android Studio
choco install androidstudio

# install Android SDK
choco install android-sdk



# install Appium Android Driver
appium driver install uiautomator2

