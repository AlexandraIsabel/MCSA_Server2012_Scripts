# A script to setup the Networking settings of newly installed VMs

# Variable Setup
$Edition = Get-WindowsEdition -Online
$DefaultGateway = "10.10.1.250"
$PrefixLength = 16
$DNS = 10.10.1.200
$IFace = "Ethernet"
$Gui = Get-WindowsOptionalFeature -Online | Where {$_.FeatureName -eq "Server-Gui-Shell"}
$Suffix = "410Server2012.local"
$HyperV = Read-Host 'Will this system use Hyper-V?'

# Set the network profile location to Private
Set-NetConnectionProfile -NetworkCategory Private -InterfaceAlias $IFace

# Set DNS Suffix
Set-DnsClient -InterfaceAlias $IFace -ConnectionSpecificSuffix $Suffix

# Set Network Setting based on the Edition returned by Get-WindowsEdition and Option Features installed
if($Edition -eq "Edition : ServerStandardEval")
	{
		# Check if the server isn't running Core
		if($Gui.State -eq "Enabled")
		{
			# Check if this is 410Server2
			if ($HyperV -like "n")
			{
				New-NetIPAddress -AddressFamily IPv4 -PrefixLength $PrefixLength -InterfaceAlias $IFace -DefaultGateway $DefaultGateway -IPAddress 10.10.1.1
			}
			else
			{
				New-NetIpAddress -AddressFamily IPv4 -PrefixLength $PrefixLength -InterfaceAlias $IFace -DefaultGateway $DefaultGateway -IPAddress 10.10.1.2
			}
		}
		else
		{
			New-NetIpAddress -AddressFamily IPv4 -PrefixLength $PrefixLength -InterfaceAlias $IFace -DefaultGateway $DefaultGateway -IPAddress 10.10.1.5
		}
	}
else
{
	# Then this MUST be the Client OS
	New-NetIpAddress -AddressFamily IPv4 -PrefixLength $PrefixLength -InterfaceAlias $IFace -DefaultGateway $DefaultGateway -IPAddress 10.10.1.10
}

# Join the computer to the appropriate workgroup
Add-Computer -WorkgroupName "410Server2012"