param($domain, $password)

$smPassword = (ConvertTo-SecureString $password -AsPlainText -Force)

Install-WindowsFeature -Name "Web-Server" `
                       -IncludeManagementTools `
                       -IncludeAllSubFeature  

Install-WindowsFeature -Name "Web-Mgmt-Tools"