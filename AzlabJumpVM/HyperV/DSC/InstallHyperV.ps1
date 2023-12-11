Configuration InstallHyperV
{
    Import-DscResource -Module xPendingReboot # Used for Reboots

    Node localhost
    {
        LocalConfigurationManager
        {
            RebootNodeIfNeeded = $true
        }

        WindowsFeature 'Hyper-V'
        {
            Name   = 'Hyper-V'
            Ensure = 'Present'
            IncludeAllSubFeature = $true
        }

        xPendingReboot AfterRoleInstallation
        {
            Name       = 'AfterRoleInstallation'
        }
     }
  }