﻿# Test file for the Vester module - https://github.com/WahlNetwork/Vester
# Called via Invoke-Pester VesterTemplate.Tests.ps1

# Test title, e.g. 'DNS Servers'
$Title = 'Hosts PoweredOn'

# Test description: How New-VesterConfig explains this value to the user
$Description = 'Number of hosts with PowerState is PoweredOn'

# The config entry stating the desired values
$Desired = $cfg.vcenter.HostsPoweredOn

# The test value's data type, to help with conversion: bool/string/int
$Type = 'int'

# The command(s) to pull the actual value for comparison
# $Object will scope to the folder this test is in (Cluster, Host, etc.)
[ScriptBlock]$Actual = {
    (Get-VMHost | Where-Object {$_.PowerState -eq 'PoweredOn' }).Count
}

# The command(s) to match the environment to the config
# Use $Object to help filter, and $Desired to set the correct value
[ScriptBlock]$Fix = {
    Write-Host "Number of hosts with PowerState is Powered On"
}
