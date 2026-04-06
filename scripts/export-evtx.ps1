$destination = ".\logs\evtx"
New-Item -ItemType Directory -Force -Path $destination | Out-Null

wevtutil epl Microsoft-Windows-Sysmon/Operational "$destination\sysmon.evtx"
wevtutil epl Microsoft-Windows-PowerShell/Operational "$destination\powershell.evtx"
wevtutil epl Security "$destination\security.evtx"

Write-Host "Export complete. Files saved to $destination"
dir $destination