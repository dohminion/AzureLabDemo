Get-DnsClientServerAddress
Get-DnsClientServerAddress | Where-Object {($_.interfaceAlias -like 'Ethernet') -and ($_.ServerAddresses -like '*')} |Set-DnsClientServerAddress -ServerAddresses ("10.0.0.4","10.151.12.242","10.151.12.146","172.22.32.250","10.150.60.100")
Get-DnsClientServerAddress
add-computer -domainname pkilab.local -Passthru -OUPath "OU=T0 Tool Servers,OU=T0 Servers,OU=Tier0,DC=PKILab,DC=local"
Pause
Restart-computer

Pause

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco feature enable -n allowGlobalConfirmation
choco install powershell-core
#choco install microsoft-windows-terminal --pre 
choco install vscode
choco install vscode-powershell
choco install git
choco install vscode-gitlens
choco install windows-admin-center
code --install-extension CoenraadS.bracket-pair-colorizer-2
#dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
#dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
#wsl --set-default-version 2
#Start-Process https://www.microsoft.com/en-us/p/ubuntu/9nblggh4msv6?activetab=pivot:overviewtab
#sudo do-release-upgrade -d
