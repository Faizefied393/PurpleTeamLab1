# Detection Report: Persistence Simulation

## Summary
This scenario simulated persistence-related behavior in a controlled Windows lab and validated whether host telemetry captured the activity.

## Objective
Determine whether the lab can observe and detect persistence behavior associated with startup or registry mechanisms.

## Tools Used
- Windows
- Sysmon
- PowerShell logging
- Atomic Red Team
- Chainsaw

## Test Performed
Executed a safe persistence-related Atomic Red Team test mapped to T1547.

## Evidence Observed
- process creation telemetry
- suspicious command-line arguments
- startup or registry-related activity

## Detection Logic
Detection focused on:
- reg.exe usage
- schtasks.exe usage
- Run key modification patterns
- scheduled task creation behavior

## Result
The simulated persistence behavior generated observable telemetry suitable for detection development.

## Improvements
- add registry-specific event monitoring
- correlate process and registry events
- tune logic for legitimate admin behavior