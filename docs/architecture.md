# Architecture Diagram

PurpleTeamLab1 follows a simple purple team workflow:

Atomic Red Team simulates adversary behavior on a Windows host. Sysmon and PowerShell logging capture telemetry, which is exported as EVTX. Chainsaw and Sigma rules are then used to analyze and validate detections. Results are documented in reports and mapped to MITRE ATT&CK.

## Flow
Atomic Red Team -> Windows Host -> Sysmon/PowerShell Logging -> EVTX Logs -> Chainsaw/Sigma -> Reports/MITRE/GitHub

