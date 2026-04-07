# Detection Coverage Matrix

| Scenario | ATT&CK Technique | Data Source | Detection Rule | Report | Status |
|---|---|---|---|---|---|
| Suspicious PowerShell Execution | T1059.001 | Sysmon, PowerShell Logs | detections/sigma/powershell.yml | reports/detection-report-1.md | Complete |
| Credential Access Simulation | T1003 | Sysmon, Security Logs | detections/sigma/credential_access.yml | reports/detection-report-2.md | Complete |
| Persistence via Run Key | T1547 | Sysmon, Registry-related Events | detections/sigma/persistence_runkey.yml | reports/detection-report-3.md | Complete |
| Suspicious Scheduled Task Creation | T1053 | Sysmon, Security Logs | planned | planned | Planned |
| Discovery Commands | T1082 | Sysmon, PowerShell Logs | planned | planned | Planned |