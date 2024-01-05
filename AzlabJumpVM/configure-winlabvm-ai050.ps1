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

# install Python latest version 3.11.6 because 3.12 breaks pip for azure
# installing before Anaconda, to make sure Anaconda has the default path
choco install python --version=3.11.6

# install Anaconda Distribution (Python 3.x) 2023.9.0
choco install anaconda3

# install Visual Studio 2022 Build tools
choco install visualstudio2022buildtools --package-parameters "--add Microsoft.VisualStudio.Component.VC.140 --passive --locale en-US --add Microsoft.VisualStudio.Component.Windows10SDK.$($PSVersionTable.BuildVersion.Build) --no-includeRecommended" -y --timeout 0

cmd /c mklink "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\BIN\x86_amd64\rc.exe" "C:\Program Files (x86)\Windows Kits\10\bin\$($PSVersionTable.BuildVersion.Major).$($PSVersionTable.BuildVersion.Minor).$($PSVersionTable.BuildVersion.Build).0\x64\rc.exe"
cmd /c mklink "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\BIN\x86_amd64\rcdll.dll" "C:\Program Files (x86)\Windows Kits\10\bin\$($PSVersionTable.BuildVersion.Major).$($PSVersionTable.BuildVersion.Minor).$($PSVersionTable.BuildVersion.Build).0\x64\rcdll.dll"

# reload env variables to pick up Python path changes
Write-Host "Reload environment variables"
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
Write-Host "Reloaded environment variables"

# install Azure CLI latest version through pip
# choco install azure-cli
cd c:\Python311\Scripts  #navigate to python folder for pip command
pip install azure-cli
pip install transformers transformers[tensorflow] openai diffusers datasets tensorflow

# add Anaconda to PATH Env Variable
[Environment]::SetEnvironmentVariable("PATH", $Env:PATH + ";C:\Tools\Anaconda3\", [EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable("PATH", $Env:PATH + ";C:\Tools\Anaconda3\Scripts", [EnvironmentVariableTarget]::Machine)