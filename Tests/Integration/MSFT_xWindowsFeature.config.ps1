﻿
# Integration Test Config Template Version 1.0.0
param 
(
    [Parameter(Mandatory)]
    [System.String]
    $ConfigurationName
)
        

Configuration $ConfigurationName
{
    param 
    (   
        [Parameter(Mandatory = $true)]     
        [System.String]
        $Name,

        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',
        
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Source,

        [System.Boolean]
        $IncludeAllSubFeature = $false,

        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential,

        [ValidateNotNullOrEmpty()]
        [System.String]
        $LogPath
    )
    
    Import-DscResource -ModuleName 'xPSDesiredStateConfiguration'
    
    Node Localhost {

        xWindowsFeature WindowsFeatureTest
        {
            Name = $Name
            Ensure = $Ensure
            IncludeAllSubFeature = $IncludeAllSubFeature
            Credential = $Credential
        }
    }
}