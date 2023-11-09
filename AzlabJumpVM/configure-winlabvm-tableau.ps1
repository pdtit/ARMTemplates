# Install Chocolatey

# Set Chocolatey version to 1.4.0 to avoid installing .NET 4.8 Framework (which the newer 2.0 needs, but requires reboot, and blocks CustomScriptExtension

$env:chocolateyVersion = '1.4.0'

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

## updates
# allow all choco updates automatically 
choco feature enable -n allowGlobalConfirmation

# install Google Chrome
choco install googlechrome

# install Tableau 2023.2.2
choco install tableau-desktop

# copy tableau user files to desktop
    # Define the GitHub URL and the local file paths
    $GitHubURL = "https://github.com/pdtit/ARMTemplates/blob/master/AzlabJumpVM/Tableau_Files.zip" 
    $TempPath = "C:\temp\Tableau_Files.zip" 
    $DesktopPath = "$env:USERPROFILE\Desktop\Tableau_Files.zip" # Replace this with your desired desktop file name
    
    # Download the zip file from the GitHub URL and save it to the temp path
    Invoke-WebRequest -Uri $GitHubURL -OutFile $TempPath
    
    # Copy the zip file from the temp path to the desktop path
    Copy-Item -Path $TempPath -Destination $DesktopPath
