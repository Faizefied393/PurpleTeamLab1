
# PurpleTeamLab1
 
A hands-on Windows purple teaming lab focused on simulating attacker behavior, collecting host telemetry, validating detections, and documenting findings through a GitHub-based workflow.
 
---
 
## Overview
 
PurpleTeamLab1 is a beginner-to-job-ready home lab built to demonstrate practical defensive security skills. The project uses Windows logging, Sysmon, PowerShell logging, Atomic Red Team, and Sigma-based detection engineering to simulate common attacker techniques and analyze the resulting telemetry.
 
This lab is designed to show the full purple team cycle:
 
1. Simulate a technique
2. Generate telemetry
3. Review the evidence
4. Write a detection
5. Map the activity to MITRE ATT&CK
6. Document findings and improvements
 
---
 
## Objectives
 
- Simulate realistic attacker behavior in a controlled lab
- Collect and inspect Windows host telemetry
- Build detections for suspicious activity
- Map findings to MITRE ATT&CK
- Document results in a portfolio-ready format
 
---
 
## Tools Used
 
| Tool | Purpose |
|---|---|
| Windows | Lab host OS |
| Sysmon | Host telemetry and event logging |
| PowerShell Logging | Script block and module visibility |
| Atomic Red Team | Safe technique simulation |
| Chainsaw | EVTX log hunting |
| Sigma | Detection rule authoring |
| VS Code | Editing and scripting |
| Git / GitHub | Version control and documentation |
 
---
 
## Skills Demonstrated
 
- Defensive security
- Threat simulation
- Detection engineering
- Windows event log analysis
- PowerShell-based automation
- Incident-style reporting
- MITRE ATT&CK mapping
- GitHub project documentation
 
---
 
## Current Project Components
 
### Attack Scenarios
 
- **Scenario 1:** Suspicious PowerShell Execution
- **Scenario 2:** Credential Access Simulation
- **Scenario 3:** Persistence via Startup / Registry
 
### Detections
 
- Suspicious PowerShell activity
- Credential access-related activity
- Persistence via Run Key / Scheduled Task
 
### Reports
 
- Detection Report 1
- Detection Report 2
- Detection Report 3
 
### Supporting Artifacts
 
- MITRE ATT&CK mapping
- PowerShell automation scripts
- EVTX export workflow
- Screenshot folders for evidence and results
 
---
 
## Project Structure
 
```text
PurpleTeamLab1/
├── attack-scenarios/
├── detections/
│   ├── chainsaw/
│   ├── sigma/
│   ├── splunk/
│   └── yara/
├── docs/
├── logs/
│   ├── evtx/
│   └── samples/
├── mitre-mapping/
├── reports/
├── screenshots/
│   ├── dashboards/
│   ├── detections/
│   └── sysmon/
├── scripts/
├── .gitignore
├── LICENSE
└── README.md
```
 
---
 
## Lab Setup Summary
 
### 1. Sysmon
 
Sysmon was installed to improve visibility into process creation, command-line activity, registry changes, and related host events.
 
### 2. PowerShell Logging
 
PowerShell logging was enabled to improve visibility into script block and module activity.
 
### 3. Atomic Red Team
 
Atomic Red Team was configured to support safe technique simulation in the lab.
 
### 4. Log Collection
 
EVTX logs are exported through PowerShell scripts for review and detection validation.
 
---
 
## Scenarios
 
### Scenario 1: Suspicious PowerShell Execution
 
**MITRE ATT&CK:** [T1059.001 – PowerShell](https://attack.mitre.org/techniques/T1059/001/)
 
**Focus:**
- Suspicious PowerShell execution
- Encoded or obfuscated command behavior
- Command-line visibility in Sysmon and PowerShell logs
 
---
 
### Scenario 2: Credential Access Simulation
 
**MITRE ATT&CK:** [T1003 – OS Credential Dumping](https://attack.mitre.org/techniques/T1003/)
 
**Focus:**
- Suspicious process execution
- Command-line indicators tied to credential access behavior
- Visibility into potentially high-risk activity
 
---
 
### Scenario 3: Persistence via Startup / Registry
 
**MITRE ATT&CK:** [T1547 – Boot or Logon Autostart Execution](https://attack.mitre.org/techniques/T1547/)
 
**Focus:**
- Registry Run key abuse
- Scheduled task creation
- Startup-related persistence behavior
 
---
 
## Detection Engineering
 
This project currently includes Sigma rules for:
 
- Suspicious PowerShell execution
- Credential access-related process behavior
- Persistence through Run keys or scheduled tasks
 
Each detection is paired with scenario documentation and a written report describing:
 
- **Objective** — what the detection is designed to catch
- **Expected Logs** — which event sources are relevant
- **Detection Logic** — how the rule works
- **Result** — whether the detection fired as expected
- **Improvement Ideas** — notes for tuning and expanding coverage
 
---
 
## MITRE ATT&CK Mapping
 
| Scenario | Technique ID | Technique Name |
|---|---|---|
| PowerShell Execution | T1059.001 | PowerShell |
| Credential Access Simulation | T1003 | OS Credential Dumping |
| Persistence Simulation | T1547 | Boot or Logon Autostart Execution |
 
---
 
## Automation
 
PowerShell scripts are used to support the workflow, including:
 
- Running Atomic Red Team tests
- Exporting EVTX logs
- Organizing repeatable lab steps
 
---
 
## Lessons Learned
 
- Windows telemetry becomes much more valuable when Sysmon and PowerShell logging are enabled
- Detection logic needs context, not just keywords
- Safe attacker simulation helps connect red-team behavior to blue-team visibility
- Good documentation makes technical work easier to explain in interviews
 
---
 
## Future Improvements
 
- [ ] Add Splunk or Elastic for dashboarding and search
- [ ] Expand Chainsaw-based hunting
- [ ] Tune detections to reduce false positives
- [ ] Add architecture diagram
- [ ] Add more scenarios mapped to ATT&CK
- [ ] Include detection coverage matrix
 
---
 
## Lab Setup & Command Walkthrough
 
This section documents the exact commands used to build and validate the lab environment.
 
---
 
### 1. Project Initialization
 
```powershell
mkdir PurpleTeamLab1
cd PurpleTeamLab1
code .
```
 
---
 
### 2. Git Setup
 
```powershell
git init
git add .
git commit -m "Initial commit"
```
 
---
 
### 3. Sysmon Setup
 
Copy Sysmon into the project directory:
 
```powershell
Copy-Item "C:\Users\faizt\Downloads\Sysmon\Sysmon64.exe" "C:\Users\faizt\PurpleTeamLab1\"
```
 
Create the config file:
 
```powershell
notepad sysmonconfig.xml
```
 
Install Sysmon (Admin PowerShell required):
 
```powershell
cd C:\Users\faizt\PurpleTeamLab1
.\Sysmon64.exe -accepteula -i .\sysmonconfig.xml
```
 
Verify installation:
 
```powershell
Get-Service *sysmon*
Get-WinEvent -LogName "Microsoft-Windows-Sysmon/Operational" -MaxEvents 10
```
 
---
 
### 4. PowerShell Logging Configuration
 
Enable Script Block Logging and Module Logging via the registry:
 
```powershell
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -Name "EnableScriptBlockLogging" -Value 1
 
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging" -Force
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNames" -Force
 
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging" -Name "EnableModuleLogging" -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNames" -Name "*" -Value "*"
```
 
Verify:
 
```powershell
Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"
```
 
---
 
### 5. Install Atomic Red Team Module
 
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
Install-Module -Name Invoke-AtomicRedTeam -Force
Install-Module -Name powershell-yaml -Force
Import-Module Invoke-AtomicRedTeam
```
 
---
 
### 6. Configure Atomic Red Team Path
 
```powershell
$PSDefaultParameterValues["Invoke-AtomicTest:PathToAtomicsFolder"] = "C:\AtomicRedTeam\atomic-red-team-master\atomics"
```
 
---
 
### 7. Run Safe Atomic Tests
 
View available tests:
 
```powershell
Invoke-AtomicTest T1082 -ShowDetailsBrief
```
 
Run a test:
 
```powershell
Invoke-AtomicTest T1082 -TestNumbers 1
```
 
---
 
### 8. Export Logs
 
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\export-evtx.ps1
```
 
---
 
### 9. Build Chainsaw (Rust)
 
```powershell
cargo build --release
Copy-Item ".\target\release\chainsaw.exe" "C:\Users\faizt\PurpleTeamLab1\"
```
 
---
 
### 10. Analyze Logs with Chainsaw
 
```powershell
.\chainsaw.exe hunt .\logs\evtx --rules .\detections\sigma\
```
 
---
 
### 11. GitHub Commit
 
```powershell
git add .
git commit -m "Added purple team lab scenarios, detections, and setup workflow"
git push origin main
```
 
---
 
### Notes
 
- Sysmon must be installed with Administrator privileges
- Atomic Red Team requires the correct atomics folder path to be configured
- Chainsaw requires Sigma rules to detect events in logs
- Logs are exported in EVTX format for analysis and detection validation