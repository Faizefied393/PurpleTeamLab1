# Scenario 2: Credential Access Simulation

## Objective
Safely simulate behavior associated with credential access and validate whether host telemetry captures the activity.

## MITRE ATT&CK
- T1003 - OS Credential Dumping

## Hypothesis
If behavior associated with credential access occurs, host telemetry should show suspicious process execution and related access patterns.

## Test Method
Run a safe Atomic Red Team test associated with credential access simulation in a controlled lab environment.

## Expected Evidence
- Sysmon process creation events
- Security-relevant host events
- suspicious command-line activity
- unusual access or tooling behavior

## Detection Goal
Identify suspicious activity related to:
- credential access tooling
- LSASS-related access behavior
- unusual administrative commands
- suspicious process names or arguments