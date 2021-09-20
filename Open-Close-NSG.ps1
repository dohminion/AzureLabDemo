function New-NSGInbound {
    param ($resourceGroupName, $nsglist)
    foreach ($nsgname in $nsglist) {
        $ExistingNSG = Get-AzNetworkSecurityGroup -Name $nsgname -ResourceGroupName $resourceGroupName
        #add the RDP Inbound Rule
        $ExistingNSG | Add-AzNetworkSecurityRuleConfig -Name "Allow_3389" -Description "Allow RDP" -Access "Allow" -Protocol "Tcp" -Direction "Inbound" -Priority "300" -SourceAddressPrefix $myPublicIP -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 3389
        #update the NSG
        $ExistingNSG | Set-AzNetworkSecurityGroup
    }
}

function Remove-NSGInbound {
    param ($resourceGroupName, $nsglist)
    foreach ($nsgname in $nsglist) {
        $ExistingNSG = Get-AzNetworkSecurityGroup -Name $nsgname -ResourceGroupName $resourceGroupName
        Remove-AzNetworkSecurityRuleConfig -Name "Allow_3389" -NetworkSecurityGroup $ExistingNSG | Set-AzNetworkSecurityGroup
    }
}

#Get current public IP
#$myPublicIP = (Invoke-WebRequest -Uri "https://api.ipify.org").content
$myPublicIP = "13.83.64.54,13.83.64.137,13.83.64.157,52.191.227.139,52.191.227.224,128.177.111.126,208.184.4.126,63.147.206.126,209.63.234.126,40.86.184.165"


#Target the new Resource Group
$resourceGroupName = 'PSLab'
$nsglist = @("WVMNETSEGT0TL01", "WVMNETSEGT0DC01", "WVMNETSEGT0DC01") #"CESCEP1-nsg", "tool1-nsg"
#Just One:
#$nsglist = @("tool1-nsg")
#Open Ports
New-NSGInbound $resourceGroupName $nsglist

#close ports
#Remove-NSGInbound $resourceGroupName $nsglist

