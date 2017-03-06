
# Purpose

To build a simple lab using Vagrant, VirtualBox, Chocolately and PowerShell to do some test and dev.

Using Get-ToolsForENV.ps1 will install chocately and the packages needed to run the dev/test environment.

[Vagrant](https://www.vagrantup.com/ "Title")

*"Vagrant is a tool for building complete development environments. With an easy-to-use workflow and focus on automation, Vagrant lowers development environment setup time, increases development/production parity, and makes the "works on my machine" excuse a relic of the past."* 

[VirtualBox](https://www.virtualbox.org "Title")

*"VirtualBox is a general-purpose full virtualizer for x86 hardware, targeted at server, desktop and embedded use. "*

[Chocolately](https://www.virtualbox.org "Title")

*"Chocolatey is a package manager for Windows (like apt-get or yum but for Windows). It was designed to be a decentralized framework for quickly installing applications and tools that you need. It is built on the NuGet infrastructure currently using PowerShell as its focus for delivering packages from the distros to your computer."*

As well as a NAT Interface in VirtualBox you will need to add an inernal only interface and take note of the IP range. I used 192.168.10.X. This is important as you will need to specify the IP addresses of your servers for Vagrant.

