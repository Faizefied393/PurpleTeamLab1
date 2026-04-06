# Scenario 3: Persistence via Startup or Registry

## Objective
Simulate persistence behavior and validate whether host telemetry captures the change.

## MITRE ATT&CK
- T1547 - Boot or Logon Autostart Execution

## Hypothesis
If persistence-related changes occur, Sysmon and related Windows logs should capture process execution and system modification evidence.

## Test Method
Run a safe Atomic Red Team test associated with persistence in a controlled lab environment.

## Expected Evidence
- process creation events
- registry modification evidence
- scheduled task or startup-related artifacts

## Detection Goal
Identify suspicious persistence-related behavior such as:
- Run key modification
- startup folder abuse
- scheduled task creation
- suspicious use of reg.exe or schtasks.exe