# Setup Variables
$HyperV = Read-Host 'Will this server use Hyper-V?'
$Gui = Get-WindowsOptionalFeature -Online | Where {$_.FeatureName -eq "Server-Gui-Shell"}
$Edition = Get-WindowsEdition -Online
$CoreName = "410ServerCore"
$ClientName = "410Win8"
$VirtName = "410Server2"
$StdName = "410Server1"

if($Edition -eq "Edition : ServerStandardEval")
{
	# Check if the server isn't running Core
	if($Gui.State -eq "Enabled")
	{
		# Check Which non-core server this is
		if ($HyperV -like "n")
		{
			# This is 410Server1

		}
		else
		{
			# This is 410Server2

		}
	}
	else
	{
		# This is 410ServerCore

	}
}
else
{
	# Then this MUST be 410Win8

}