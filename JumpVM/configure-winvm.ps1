
# Install Chrome
$workdir = $env:TEMP;
$ChromeInstaller = "chrome_installer.exe"
Invoke-WebRequest "http://dl.google.com/chrome/install/375.126/chrome_installer.exe" -OutFile $workdir\$ChromeInstaller
Start-Process -FilePath $workdir\$ChromeInstaller -Args "/silent /install" -Verb RunAs -Wait


# Silent install Chocolatey packager
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# silent install 7zip 
choco install 7zip -confirm:$false
choco install putty.install -confirm:$false
choco install sql-server-management-studio -confirm:$false
choco install nodejs-lts -confirm:$false
choco install microsoft-edge -confirm:$false


