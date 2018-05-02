Configuration testDSC {
        
    Param
    (
        [ValidateNotNullOrEmpty()]
        [string[]]$NodeName = "localhost"
    )
     
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    Node $NodeName {
        File CreateFile {
            DestinationPath = 'C:\Users\bk\Desktop\test.txt'
            Ensure = "Present"
            Contents = "Success!"
        }
    }
}

testDSC