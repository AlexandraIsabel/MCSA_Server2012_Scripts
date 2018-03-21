# A script to setup the Networking settings of newly installed VMs

#Variable Setup
$Edition = Get-WindowsEdition -Online
$DefaultGateway = 10.10.1.250
$PrefixLength = 16
$DNS = 10.10.1.200

# Set the network profile location to Private
