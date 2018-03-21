# Setup Variables
$HyperV -eq Read-Host 'Will this server use Hyper-V?'
$Gui -eq Get-OptionWindowsFeature -Online | Where {$_.FeatureName -eq "Server-Gui-Shell"}
$Edition -eq Get-WindowsEdition -Online
$CoreName -eq "410ServerCore"
$ClientName -eq "410Win8"
$VirtName -eq "410Server2"
$StdName -eq "410Server1"