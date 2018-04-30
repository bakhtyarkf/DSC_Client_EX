Configuration WebServer {
        
    Param
    (
        [string[]]$NodeName="localhost"
    )
     
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    Node $NodeName {

        Group CompanyGroup {
            Ensure = "Present"
            GroupName = "ComGroup"
        }

        User CompanyAdmin {
            Ensure = "Present"
            FullName = "ComAdmin"
            DependsOn = "[Group]CompanyGroup"
            UserName = "testadmin"
        }

        WindowsFeature IIS
        {
            Ensure = "Present"
            Name = "Web-WebServer"
        }

        WindowsFeature ASP {
            Ensure = "Present"
            Name = "Web-Asp-Net45"
        }

        File CreateFile {
            DestinationPath = 'C:\inetpub\wwwroot'
            Ensure = "Present"
            Contents = "<h1> Hello DSC </h1>"
            DependsOn = '[WindowsFeature]IIS'
        }
    }
}

WebServer