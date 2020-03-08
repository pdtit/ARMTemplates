#Don't load Server Manager upon first logon
$HKCU = "HKCU:\Software\Microsoft\ServerManager"
New-ItemProperty -Path $HKCU -Name DoNotOpenServerManagerAtLogon -PropertyType DWORD -Value "0x1" –Force

#Disable popup to allow your PC to be discoverable on the network
$networkkey = "HKLM:\System\CurrentControlSet\Control\Network\NewNetworkWindowOff"
New-Item -Path $networkkey -Force

# Silent install Chocolatey packager
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# silent install software tools
# system tools 
choco install 7zip -confirm:$false
choco install putty.install -confirm:$false
choco install microsoft-edge -confirm:$false
choco install markdownpad2 -confirm:$false
choco install windows-admin-center -confirm:$false
choco install foxitreader -confirm:$false
choco install microsoft-edge -confirm:$false
choco install googlechrome -confirm:$false

# Azure tools
choco install azure-cli -confirm:$false
choco install microsoftazurestorageexplorer -confirm:$false
choco install azurepowershell -confirm:$false
choco install azcopy -confirm:$false

# AZ-203-204 handy tools
choco install sql-server-management-studio -confirm:$false
choco install nodejs-lts -confirm:$false
choco install cosmosdbexplorer -confirm:$false
choco install servicebusexplorer -confirm:$false
choco install docker-desktop -confirm:$false





