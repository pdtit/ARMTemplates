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

## restoring SQL Server AdventureWorks database
# MSSQLSERVER should be stopped first
Stop-Service -Name MSSQLFDLauncher
Stop-Service -Name MSSQLSERVER

#start a new SQL Server instance for the restore
	$sqlJob = Start-Job -Name Sql -ScriptBlock {
	  & 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Binn\sqlservr.exe' -m
	}

	try {
	    Write-Host 'Sql Server status'
	    $sqlJob.JobStateInfo
	
	    # Connect to the local SQL instance using SMO
	    [System.Reflection.Assembly]::LoadWithPartialName('Microsoft.SqlServer.SMO') | out-null
	    $s = new-object('Microsoft.SqlServer.Management.Smo.Server') Localhost
	    [string]$nm = $s.Name
	    [string]$mode = $s.Settings.LoginMode
	
	    # Change to Mixed Mode
	    $s.Settings.LoginMode = [Microsoft.SqlServer.Management.SMO.ServerLoginMode]::Mixed
     			$s.Settings.DefaultFile = $data
			$s.Settings.DefaultLog = $logs
			$s.Settings.BackupDirectory = $backups
	    $s.Alter()
	
	    		$logs = "G:\SQLLog"
			$data = "F:\SQLData"
			$backups = "D:\SQLTemp" 
			
			# Setup the data, backup and log directories as well as mixed mode authentication
			#Import-Module "sqlps" -DisableNameChecking
	  		#Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
			#Install-Module -Name SqlServer -AllowClobber -Force
			[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo")
			#$sqlesq = new-object ('Microsoft.SqlServer.Management.Smo.Server') Localhost
			#$sqlesq.Settings.LoginMode = [Microsoft.SqlServer.Management.Smo.ServerLoginMode]::Mixed
	  		
			#$sqlesq.Settings.DefaultFile = $data
			#$sqlesq.Settings.DefaultLog = $logs
			#$sqlesq.Settings.BackupDirectory = $backups
			#$sqlesq.Alter() 
	
			# Restart the SQL Server service
			Restart-Service -Name "MSSQLSERVER" -Force
			# Re-enable the sa account and set a new password to enable login
			#Invoke-Sqlcmd -ServerInstance Localhost -Database "master" -Query "ALTER LOGIN sa ENABLE" -TrustServerCertificate
			#Invoke-Sqlcmd -ServerInstance Localhost -Database "master" -Query "ALTER LOGIN sa WITH PASSWORD = 'P@55w.rdP@55w.rd'" -TrustServerCertificate
	
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
	  
	}
finally {
    $sqlJob.StopJob()

# Start MSSQLSERVER process again
Start-Service -Name MSSQLSERVER        	
}		
Stop-Transcript
