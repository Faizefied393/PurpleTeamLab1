$atomicsPath = "C:\AtomicRedTeam\atomic-red-team-master\atomics"

Write-Host "[+] Starting purple team workflow..."
Write-Host "[+] Running PowerShell simulation..."
Invoke-AtomicTest T1059.001 -PathToAtomicsFolder $atomicsPath -TestNumbers 17

Write-Host "[+] Running credential access simulation..."
Invoke-AtomicTest T1003 -PathToAtomicsFolder $atomicsPath -ShowDetailsBrief

Write-Host "[+] Running persistence simulation..."
Invoke-AtomicTest T1547 -PathToAtomicsFolder $atomicsPath -TestNumbers 3

Write-Host "[+] Exporting logs..."
powershell -ExecutionPolicy Bypass -File .\scripts\export-evtx.ps1

Write-Host "[+] Workflow complete."