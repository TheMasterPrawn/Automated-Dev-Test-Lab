
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force

# Install Stuff
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
choco install git.install -y
choco install classic-shell -y
choco install nuget.commandline -y
choco install bginfo -y

# Set local administrator password
$user = [adsi]"WinNT://localhost/Administrator,user"
$user.SetPassword("P@ssword1")
$user.SetInfo()

Install-WindowsFeature PowerShell-ISE

choco install powershell -y #Need powershell 5, needs reboot
