# Test file for the Vester module - https://github.com/WahlNetwork/Vester
# Called via Invoke-Pester VesterTemplate.Tests.ps1

# Test title, e.g. 'DNS Servers'
$Title = 'SDRS BatchTagQuery'

# Test description: How New-VesterConfig explains this value to the user
$Description = 'SDRS Advanced - BatchTagQuery'
# The valid values are: [int] -1, 0 or  1
# A value of -1 will remove the setting

# The config entry stating the desired values
$Desired = $cfg.dscluster.BatchTagQuery

# The test value's data type, to help with conversion: bool/string/int
$Type = 'int'

# The command(s) to pull the actual value for comparison
# $Object will scope to the folder this test is in (Cluster, Host, etc.)
[ScriptBlock]$Actual = {
    if (Get-AdvancedSetting -Entity $object -Name BatchTagQuery) {
        (Get-AdvancedSetting -Entity $object -Name BatchTagQuery).Value
    }
    else {
        -1
    }
}

# The command(s) to match the environment to the config
# Use $Object to help filter, and $Desired to set the correct value
[ScriptBlock]$Fix = {
    if ($Desired -eq "-1") {
        Get-AdvancedSetting -Entity $object -Name BatchTagQuery | Remove-AdvancedSetting -Confirm:$false -ErrorAction Stop
    } 
    else {
        $Object | New-AdvancedSetting -Name BatchTagQuery -Value $Desired -Force -Confirm:$false -ErrorAction Stop
    }
}