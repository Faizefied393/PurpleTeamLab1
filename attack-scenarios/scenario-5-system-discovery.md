\# Scenario 5: System Discovery



\## Objective

Simulate basic system discovery behavior and validate command execution visibility.



\## MITRE ATT\&CK

T1082 – System Information Discovery



\## Hypothesis

Discovery commands should be visible in Sysmon and PowerShell logs.



\## Expected Logs

\- Sysmon process creation

\- PowerShell logging

\- Command-line evidence for discovery activity



\## Detection Goal

Identify common discovery commands and suspicious enumeration behavior.

