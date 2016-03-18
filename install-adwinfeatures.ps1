#################################################################################
# Install IIS, MSMQ, WCF, .NET 4.5
#################################################################################

# To verify the installation this could use Get-WindowsFeature
Write-Host "Installing AD-Domain-Services/DNS/DHCP"
Install-WindowsFeature AD-Domain-Services
Install-WindowsFeature DNS
Install-WindowsFeature DHCP

#################################################################################
# Enable remote desktop and some default Windows explorer features
#################################################################################
Write-Host "Enabling remote desktop"
netsh advfirewall firewall add rule name="Open Port 3389" dir=in action=allow protocol=TCP localport=3389
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
