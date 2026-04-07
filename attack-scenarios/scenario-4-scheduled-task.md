\# Scenario 4: Scheduled Task Creation



\## Objective

Simulate suspicious scheduled task creation and validate whether the lab captures process and task-related activity.



\## MITRE ATT\&CK

T1053 – Scheduled Task/Job



\## Hypothesis

If a scheduled task is created, related process creation and task creation evidence should be visible in telemetry.



\## Expected Logs

\- Sysmon process creation

\- Security logs where available

\- Command-line evidence involving schtasks.exe



\## Detection Goal

Detect suspicious use of schtasks.exe and task creation behavior.

