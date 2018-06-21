param($password)

$smPassword = (ConvertTo-SecureString $password -AsPlainText -Force)

Install-WindowsFeature -Name "Web-Server" `
                       -IncludeManagementTools `
                       -IncludeAllSubFeature  

