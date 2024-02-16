
Configuration Main
{

Param ( [string] $nodeName )

Import-DscResource -ModuleName PSDesiredStateConfiguration

Node $nodeName
  {
  Script InstallSQL
    {
        TestScript = {
            return $false
        }
        SetScript ={

		$logs = "G:\SQLLog"
		$data = "F:\SQLData"
		$backups = "D:\SQLTemp" 
		
		# Setup the data, backup and log directories as well as mixed mode authentication
		Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
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

		#run the actual database restore
		Restore-SqlDatabase -ServerInstance Localhost -Database "AdventureWorks2022" -BackupFile $dbbackupfile -AutoRelocateFile -PassThru


		#allow connection to SQL Instance
		New-NetFirewallRule -DisplayName "SQL Server" -Direction Inbound -Protocol TCP -LocalPort 1433 -Action allow 
		}
		
     #GetScript = {@{Result = "ConfigureSql"}}
	}
  }
}
