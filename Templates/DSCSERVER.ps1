Configuration DSCSERVER
{
    param(

    [string] $ComputerName
    )

    Import-DscResource -ModuleName PSDesiredStateConfiguration
    
    Node $ComputerName
    {
        File DirectoryCopy
        {
            Ensure = "Present"  # You can also set Ensure to "Absent"
            Type = "Directory" # Default is "File".
            Recurse = $true # Ensure presence of subdirectories, too
            SourcePath = "https://github.com/Aswinkumar6/DSC-Configuration"
            DestinationPath = "C:\Users\Public\Documents\DSCDemo\DemoDestination"
        }
        
        WindowsFeature WindowsFeature
        {
            Name                    = Web-Server
            Ensure                  = 'Present'
            IncludeAllSubFeature    = $true
        }   
    }
}
