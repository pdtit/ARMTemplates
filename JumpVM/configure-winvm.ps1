
# Install Chrome
$workdir = $env:TEMP;
$ChromeInstaller = "chrome_installer.exe"
Invoke-WebRequest "http://dl.google.com/chrome/install/375.126/chrome_installer.exe" -OutFile $workdir\$ChromeInstaller
Start-Process -FilePath $workdir\$ChromeInstaller -Args "/silent /install" -Verb RunAs -Wait


# Silent install Adobe Reader DC
$workdir = $env:TEMP;
$adobesource = "http://ardownload.adobe.com/pub/adobe/reader/win/AcrobatDC/1502320053/AcroRdrDC1502320053_en_US.exe"
$adobedestination = "$workdir\adobeDC.exe"
Invoke-WebRequest $adobesource -OutFile $adobedestination
Start-Process -FilePath "$workdir\adobeDC.exe" -ArgumentList "/sPB /rs"

# Silent install MarkdownPad
$workdir = $env:TEMP;
$markdownreaderinstaller = "markdownpad2-setup.exe"
$markdownreadersource = "http://markdownpad.com/download/markdownpad2-setup.exe"
$markdownreaderdestination = "$workdir\markdownpad2-setup.exe"
Invoke-WebRequest -Uri $markdownreadersource -OutFile $markdownreaderdestination 
Start-Process -FilePath $workdir\$markdownreaderinstaller -Args "/exenoui /install" -Verb RunAs -Wait

# Silent install Chocolatey packager
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# silent install 7zip 
choco install 7zip
choco install putty.install
choco install sql-server-management-studio
choco install nodejs-lts
choco install microsoft-edge


