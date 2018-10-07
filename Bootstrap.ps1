#
# Bootstrap file for:
#               wdocker-caddy
#

# Functions
function Confirm-Directory {
 param( [string]$InputDir )
 if ((Test-Path -Path $InputDir) -eq $false)
 {
    Write-Ouput "[$(Get-Date)]: The dir $InputDir does not exist. Creating it.. "
    New-Item -ItemType Directory -Path $InputDir 
 }
}

# Check if the config dirs are created, be sure to use a volume mount for this data.
Write-Output "Checking config dirs in volume mount.. "
Confirm-Directory "G:\conf"
Confirm-Directory "G:\html"
Confirm-Directory "G:\logs"

Write-Output "[$(Get-Date)]: Bootstrapping Caddy.exe.. "
& C:\caddy\caddy.exe