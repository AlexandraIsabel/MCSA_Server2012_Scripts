# Setup Variables
$HyperV = Read-Host 'Will this server use Hyper-V?'
$Gui = Get-WindowsOptionalFeature -Online | Where {$_.FeatureName -eq "Server-Gui-Shell"}
$Edition = Get-WindowsEdition -Online
$CoreName = "410ServerCore"
$ClientName = "410Win8"
$VirtName = "410Server2"
$StdName = "410Server1"
