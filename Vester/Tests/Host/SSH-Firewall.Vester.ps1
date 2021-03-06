﻿# Test file for the Vester module - https://github.com/WahlNetwork/Vester
# Called via Invoke-Pester VesterTemplate.Tests.ps1

# Test title, e.g. 'DNS Servers'
$Title = 'SSH Server Firewall'

# Test description: How New-VesterConfig explains this value to the user
$Description = 'On/off switch to set a SSH Server exception in the host firewall'

# The config entry stating the desired values
$Desired = $cfg.host.esxntpfirewallexception

# The test value's data type, to help with conversion: bool/string/int
$Type = 'bool'

# The command(s) to pull the actual value for comparison
# $Object will scope to the folder this test is in (Cluster, Host, etc.)
[ScriptBlock]$Actual = {
    ($Object | Get-VMHostFirewallException -name "SSH Server").Enabled
}

# The command(s) to match the environment to the config
# Use $Object to help filter, and $Desired to set the correct value
[ScriptBlock]$Fix = {
    $Object | Get-VMHostFirewallException -name "SSH Server" | Set-VMHostFirewallException -Enabled $Desired -ErrorAction Stop
}
