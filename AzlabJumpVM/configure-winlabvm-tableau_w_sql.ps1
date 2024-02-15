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

## restoring SQL Server AdventureWorks database
        $logs = "G:\SQLLog"
		$data = "F:\SQLData"
		$backups = "F:\SQLTemp" 
		
		# Setup the data, backup and log directories as well as mixed mode authentication
		#Import-Module "sqlps" -DisableNameChecking
		Install-Module -Name SqlServer -RequiredVersion 21.1.18102 -AllowClobber -Force
		[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo")
		$sqlesq = new-object ('Microsoft.SqlServer.Management.Smo.Server') Localhost
		$sqlesq.Settings.LoginMode = [Microsoft.SqlServer.Management.Smo.ServerLoginMode]::Mixed
		$sqlesq.Settings.DefaultFile = $data
		$sqlesq.Settings.DefaultLog = $logs
		$sqlesq.Settings.BackupDirectory = $backups
		$sqlesq.Alter() 

		# Restart the SQL Server service
		Restart-Service -Name "MSSQLSERVER" -Force
		# Re-enable the sa account and set a new password to enable login
		Invoke-Sqlcmd -ServerInstance Localhost -Database "master" -Query "ALTER LOGIN sa ENABLE"
		Invoke-Sqlcmd -ServerInstance Localhost -Database "master" -Query "ALTER LOGIN sa WITH PASSWORD = 'P@55w.rdP@55w.rd'"

		# Download the Microsoft.eShopOnWeb.CatalogDb database backup 
		$dbsource = "https://azlabstudentsstor.blob.core.windows.net/labartifacts/AdventureWorks2022.bak"
		$dbbackupfile = "F:\SQLDATA\AdventureWorks2022.bak"
		$dbdestination = "F:\SQLDATA\AdventureWorks2022.bak"

		Invoke-WebRequest $dbsource -OutFile $dbdestination -UseBasicParsing

		# Define parameters for the actual restore
		#RelocateData = sets the location for the database
		#RelocateLog = sets the location for the logfiles
		#$file = sets the parameter to both database and logfiles
		#$myarr = data and logfile is stored as an array, which is picked up by the restore-sqldatabase PowerSHell cmd

		#try without relocate 
		#$RelocateData = New-Object 'Microsoft.SqlServer.Management.Smo.RelocateFile, Microsoft.SqlServer.SmoExtended, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91' -ArgumentList "Microsoft.eShopOnWeb.CatalogDb2014_Data", "F:\Data\Microsoft.eShopOnWeb.CatalogDbDB.mdf"
		#$RelocateLog = New-Object 'Microsoft.SqlServer.Management.Smo.RelocateFile, Microsoft.SqlServer.SmoExtended, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91' -ArgumentList "Microsoft.eShopOnWeb.CatalogDb2014_Log", "F:\Logs\Microsoft.eShopOnWeb.CatalogDbDB.ldf"
		#$file = New-Object Microsoft.SqlServer.Management.Smo.RelocateFile($RelocateData,$RelocateLog) 
		#$myarr=@($RelocateData,$RelocateLog)

		#run the actual database restore
		#original cmdlet Restore-SqlDatabase -ServerInstance Localhost -Database "Microsoft.eShopOnWeb.CatalogDb" -BackupFile $dbbackupfile -RelocateFile $myarr
		
		#Restore-SqlDatabase -ServerInstance Localhost -Database "Microsoft.eShopOnWeb.CatalogDb" -RestoreAction Database -BackupFile $dbbackupfile 
		Restore-SqlDatabase -ServerInstance Localhost -Database "AdventureWorks2022" -BackupFile $dbbackupfile -AutoRelocateFile -PassThru


		#allow connection to SQL Instance
		New-NetFirewallRule -DisplayName "SQL Server" -Direction Inbound -Protocol TCP -LocalPort 1433 -Action allow 
		
	
