# Disable IE Enhanced Security Configuration
$AdminKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}"
$UserKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}"

New-Item -Path $adminKey -Force
New-Item -Path $UserKey -Force
New-ItemProperty -Path $AdminKey -Name "IsInstalled" -Value 0
New-ItemProperty -Path $UserKey -Name "IsInstalled" -Value 0

#Disable popup to allow your PC to be discoverable on the network
$networkkey = "HKLM:\System\CurrentControlSet\Control\Network\NewNetworkWindowOff"
New-Item -Path $networkkey -Force

#Don't load Server Manager upon first logon
$HKCU = "HKCU:\Software\Microsoft\ServerManager"
Set-ItemProperty -path $HKCU -Name "DoNotOpenServerManagerAtLogon" -value 1 

#Disable IE popup do not allow customized settings
$HKLM = "HKLM:\Software\Policies\Microsoft\InternetExplorer\Main"
$HKCU = "HKCU:\Software\Policies\Microsoft\InternetExplorer\Main"
set-itemproperty -path $hklm -Name "DisableFirstRunCustomize" -value 1
set-itemproperty -path $hklm -Name "DisableFirstRunCustomize" -value 1

#Point to Portal.Azure.com as default IE Home Page
$HKLM = "HKLM:\Software\Policies\Microsoft\InternetExplorer\Main"
$HKCU = "HKCU:\Software\Policies\Microsoft\InternetExplorer\Main"
set-itemproperty -path $hklm -Name "DisableFirstRunCustomize" -value 1
set-itemproperty -path $hklm -Name "DisableFirstRunCustomize" -value 1


# Enable file downloads
$HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1"
$HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1"
Set-ItemProperty -Path $HKLM -Name "1803" -Value 0
Set-ItemProperty -Path $HKCU -Name "1803" -Value 0
$HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2"
$HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2"
Set-ItemProperty -Path $HKLM -Name "1803" -Value 0
Set-ItemProperty -Path $HKCU -Name "1803" -Value 0
$HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3"
$HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3"
Set-ItemProperty -Path $HKLM -Name "1803" -Value 0
Set-ItemProperty -Path $HKCU -Name "1803" -Value 0
$HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4"
$HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4"
Set-ItemProperty -Path $HKLM -Name "1803" -Value 0
Set-ItemProperty -Path $HKCU -Name "1803" -Value 0

# Disable IE Protected Mode
$HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1"
$HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1"
Set-ItemProperty -Path $HKLM -Name "2500" -Value 3
Set-ItemProperty -Path $HKCU -Name "2500" -Value 3
$HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2"
$HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2"
Set-ItemProperty -Path $HKLM -Name "2500" -Value 3
Set-ItemProperty -Path $HKCU -Name "2500" -Value 3
$HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3"
$HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3"
Set-ItemProperty -Path $HKLM -Name "2500" -Value 3
Set-ItemProperty -Path $HKCU -Name "2500" -Value 3
$HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4"
$HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4"
Set-ItemProperty -Path $HKLM -Name "2500" -Value 3
Set-ItemProperty -Path $HKCU -Name "2500" -Value 3

# Allow file downloads
$HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1"
$HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1"
Set-ItemProperty -Path $HKLM -Name "1807" -Value 0
Set-ItemProperty -Path $HKCU -Name "1807" -Value 0
$HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2"
$HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2"
Set-ItemProperty -Path $HKLM -Name "1807" -Value 0
Set-ItemProperty -Path $HKCU -Name "1807" -Value 0
$HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3"
$HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3"
Set-ItemProperty -Path $HKLM -Name "1807" -Value 0
Set-ItemProperty -Path $HKCU -Name "1807" -Value 0
$HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4"
$HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4"
Set-ItemProperty -Path $HKLM -Name "1807" -Value 0
Set-ItemProperty -Path $HKCU -Name "1807" -Value 0


# Allow file downloads
$HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1"
$HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1"
Set-ItemProperty -Path $HKLM -Name "2707" -Value 0
Set-ItemProperty -Path $HKCU -Name "2707" -Value 0
$HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2"
$HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2"
Set-ItemProperty -Path $HKLM -Name "2707" -Value 0
Set-ItemProperty -Path $HKCU -Name "2707" -Value 0
$HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3"
$HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3"
Set-ItemProperty -Path $HKLM -Name "2707" -Value 0
Set-ItemProperty -Path $HKCU -Name "2707" -Value 0
$HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4"
$HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4"
Set-ItemProperty -Path $HKLM -Name "2707" -Value 0
Set-ItemProperty -Path $HKCU -Name "2707" -Value 0

# Enable Font downloads
$HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1"
$HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1"
Set-ItemProperty -Path $HKLM -Name "1604" -Value 0
Set-ItemProperty -Path $HKCU -Name "1604" -Value 0
$HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2"
$HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2"
Set-ItemProperty -Path $HKLM -Name "1604" -Value 0
Set-ItemProperty -Path $HKCU -Name "1604" -Value 0
$HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3"
$HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3"
Set-ItemProperty -Path $HKLM -Name "1604" -Value 0
Set-ItemProperty -Path $HKCU -Name "1604" -Value 0
$HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4"
$HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4"
Set-ItemProperty -Path $HKLM -Name "1604" -Value 0
Set-ItemProperty -Path $HKCU -Name "1604" -Value 0



# allow websites to open windows without address or status bars 
$HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1"
$HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1"
Set-ItemProperty -Path $HKLM -Name "2104" -Value 0
Set-ItemProperty -Path $HKCU -Name "2104" -Value 0
$HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2"
$HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2"
Set-ItemProperty -Path $HKLM -Name "2104" -Value 0
Set-ItemProperty -Path $HKCU -Name "2104" -Value 0
$HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3"
$HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3"
Set-ItemProperty -Path $HKLM -Name "2104" -Value 0
Set-ItemProperty -Path $HKCU -Name "2104" -Value 0
$HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4"
$HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4"
Set-ItemProperty -Path $HKLM -Name "2104" -Value 0
Set-ItemProperty -Path $HKCU -Name "2104" -Value 0

$HKLM = "HKLM:\Software\Microsoft\Internet Explorer\Security"
New-ItemProperty -Path $HKLM -Name "DisableSecuritySettingsCheck" -Value 1 -PropertyType DWORD
Set-ItemProperty -Path $HKLM -Name "DisableSecuritySettingsCheck" -Value 1
Stop-Process -Name Explorer
Write-Host "IE Enhanced Security Configuration (ESC) has been disabled." -ForegroundColor Green

# Allow programmatic clipboard access
$HKLM = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3"
$HKCU = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3"
Set-ItemProperty -Path $HKLM -Name "1407" -Value 0
Set-ItemProperty -Path $HKCU -Name "1407" -Value 0


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

# Silent install Azure CLI
$workdir = $env:TEMP;
$azureclisource = "https://aka.ms/installazurecliwindows"
$azureclidestination = "$workdir\azurecli.msi"
Invoke-WebRequest -Uri $azureclisource -OutFile $azureclidestination 
Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'

# Silent install AZ PowerShell Module
Install-Module -Name Az -Repository PSGallery -Force

# Silent install Azure Storage Explorer
$workdir = $env:TEMP;
$azstoxinstaller = "StorageExplorer.exe"
$azurestoxsource = "https://go.microsoft.com/fwlink/?LinkId=708343&clcid=0x409"
$azurestoxdestination = "$workdir\storageexplorer.exe"
Invoke-WebRequest -Uri $azurestoxsource -OutFile $azurestoxdestination 
Start-Process -FilePath $workdir\$azstoxinstaller -Args "/silent /install" -Verb RunAs -Wait

# Silent install Docker Desktop
$workdir = $env:TEMP;
$dockerinstaller = "Docker Desktop Explorer.exe"
$dockersource = "https://download.docker.com/win/stable/Docker%20Desktop%20Installer.exe"
$dockerdestination = "$workdir\Docker Desktop Explorer.exe"
Invoke-WebRequest -Uri $dockersource -OutFile $dockerdestination 
Start-Process -FilePath $workdir\$dockerinstaller -Args "install --quiet" -Verb RunAs -Wait


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


