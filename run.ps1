Set-ExecutionPolicy Bypass -Scope Process
.\WinVM.ps1
$targetNode = "winslave.westeurope.cloudapp.azure.com"
$pass = ConvertTo-SecureString "Password" -AsPlainText -Force
$creds = New-Object System.Management.Automation.PSCredential ("UserName", $pass)
$session = New-CimSession -ComputerName $targetNode -Credential $creds
Start-DscConfiguration -Path .\WebServer -CimSession $session
