Start-Transcript -Path "C:\Temp\CustomScript.log" -Append

# Install Chocolatey

# Set Chocolatey version to 1.4.0 to avoid installing .NET 4.8 Framework (which the newer 2.0 needs, but requires reboot, and blocks CustomScriptExtension

$env:chocolateyVersion = '1.4.0'

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

## updates
# allow all choco updates automatically 
choco feature enable -n allowGlobalConfirmation

# install Google Chrome
choco install googlechrome --pre=120.0.6099.110 --ignore-checksums -y #pdt fixing an issue on Jan4 with new msi package

# install Tableau 2023.2.2
choco install tableau-desktop

# install Office 365
#choco install office365business

# copy tableau user files to desktop
    # Define the GitHub URL and the local file paths
    $SourceURL = "https://azlabstudentsstor.blob.core.windows.net/labartifacts/Tableau_Files.zip" 
    $TempPath = "C:\temp\Tableau_Files.zip" 
    $DesktopPath = "C:\users\Public\Desktop\Tableau_Files.zip" # Replace this with your desired desktop file name
        
    # Download the zip file from the GitHub URL and save it to the temp path
    Invoke-WebRequest -Uri $SourceURL -OutFile $TempPath
    
    # Copy the zip file from the temp path to the desktop path
    Copy-Item -Path $TempPath -Destination $DesktopPath
    #endofscript
