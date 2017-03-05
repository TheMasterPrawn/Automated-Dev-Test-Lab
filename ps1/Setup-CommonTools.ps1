Param(
    $LabIPAddressPattern = "192.168.0.*",
    $VagrantIPPattern    = "192.168.10.*"
)

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force

Set-StrictMode -Version Latest 
$ErrorActionPreference = "Stop"

# Install Stuff
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

choco install git.install -y
Install-Module -Name Pester -Confirm:$true
Install-Module -Name PSScriptAnalyzer -Confirm:$true
Install-WindowsFeature PowerShell-ISE
choco install classic-shell -y
choco install nuget.commandline -y
choco install powershell -y #Need powershell 5, needs reboot
choco install bginfo -y 

# Set local administrator password
$user = [adsi]"WinNT://localhost/Administrator,user"
$user.SetPassword("P@ssword1")
$user.SetInfo()


 <#
# Rename the LAB interface
Get-NetAdapter -InterfaceIndex (Get-NetIPAddress -IPAddress $LabIPAddressPattern).InterfaceIndex | 
    Rename-NetAdapter -NewName Lab
   
 
    
# Ensure the primary IP address setup by vagrant is not registered
Get-NetIPConfiguration -InterfaceIndex (Get-NetIPAddress -IPAddress $VagrantIPPattern).InterfaceIndex |
    Get-NetConnectionProfile |
    Where IPv4Connectivity -ne "NoTraffic" |
Set-DnsClient -RegisterThisConnectionsAddress:$false -Verbose

    # 
    #>