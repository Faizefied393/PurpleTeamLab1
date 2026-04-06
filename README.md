# PurpleTeamLab1

A hands-on Windows purple teaming lab focused on simulating attacker behavior, collecting host telemetry, validating detections, and documenting findings through a GitHub-based workflow.

---

## Overview

PurpleTeamLab1 is a beginner-to-job-ready home lab built to demonstrate practical defensive security skills. The project uses Windows logging, Sysmon, PowerShell logging, Atomic Red Team, Chainsaw, and Sigma-based detection engineering to simulate common attacker techniques and analyze the resulting telemetry.

**Full purple team workflow:**

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
| Windows | Lab host operating system |
| Sysmon | Host telemetry and event logging |
| PowerShell Logging | Script block and module visibility |
| Atomic Red Team | Safe adversary technique simulation |
| Chainsaw | EVTX log hunting and detection validation |
| Sigma | Detection rule authoring |
| VS Code | Editing and scripting |
| Git / GitHub | Version control and documentation |

---

## Skills Demonstrated

- Defensive security analysis
- Threat simulation
- Detection engineering
- Windows event log analysis
- PowerShell-based automation
- Incident-style reporting
- MITRE ATT&CK mapping
- GitHub project documentation

---

## Project Structure

```text
PurpleTeamLab1/
├── attack-scenarios/
│   ├── scenario-1-suspicious-powershell-execution.md
│   ├── scenario-2-credential-access.md
│   └── scenario-3-persistence.md
├── detections/
│   └── sigma/
│       ├── credential_access.yml
│       ├── persistence_runkey.yml
│       └── powershell.yml
├── mitre-mapping/
│   └── attack-techniques.md
├── reports/
│   ├── detection-report-1.md
│   ├── detection-report-2.md
│   └── detection-report-3.md
├── screenshots/
│   ├── atomic-execution.png
│   ├── chainsaw-analysis.png
│   ├── code-view.png
│   ├── credential-access-t1003.png
│   ├── detection-clean.png
│   ├── powershell-logging.png
│   ├── project-structure.png
│   ├── structured-output.png
│   └── sysmon-install.png
├── scripts/
│   ├── export-evtx.ps1
│   └── run-atomic-tests.ps1
├── .gitignore
├── LICENSE
├── README.md
└── sysmonconfig.xml
```

---

## Attack Scenarios

### Scenario 1: Suspicious PowerShell Execution

**MITRE ATT&CK:** T1059.001 – PowerShell

Focus areas: suspicious PowerShell execution, encoded or obfuscated command behavior, and command-line visibility in Sysmon and PowerShell logs.

### Scenario 2: Credential Access Simulation

**MITRE ATT&CK:** T1003 – OS Credential Dumping

Focus areas: suspicious process execution, command-line indicators tied to credential access behavior, and visibility into potentially high-risk activity.

### Scenario 3: Persistence via Startup / Registry

**MITRE ATT&CK:** T1547 – Boot or Logon Autostart Execution

Focus areas: Registry Run key abuse, startup persistence behavior, and visibility into suspicious autorun changes.

---

## Detection Engineering

Sigma rules are included for the following:

- Suspicious PowerShell execution
- Credential access-related process behavior
- Persistence through Run keys

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

## Lab Setup

### 1. Project Initialization

```powershell
mkdir PurpleTeamLab1
cd PurpleTeamLab1
code .
```

### 2. Git Setup

```bash
git init
git add .
git commit -m "Initial commit"
```

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

### 5. Install Atomic Red Team Module

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
Install-Module -Name Invoke-AtomicRedTeam -Force
Install-Module -Name powershell-yaml -Force
Import-Module Invoke-AtomicRedTeam
```

### 6. Configure Atomic Red Team Path

```powershell
$PSDefaultParameterValues["Invoke-AtomicTest:PathToAtomicsFolder"] = "C:\AtomicRedTeam\atomic-red-team-master\atomics"
```

### 7. Run Safe Atomic Tests

View available tests:

```powershell
Invoke-AtomicTest T1082 -ShowDetailsBrief
```

Run a test:

```powershell
Invoke-AtomicTest T1082 -TestNumbers 1
```

### 8. Export Logs

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\export-evtx.ps1
```

### 9. Analyze Logs with Chainsaw

```powershell
.\chainsaw.exe hunt .\logs\evtx --rules .\detections\sigma\
```

### 10. GitHub Commit

```bash
git add .
git commit -m "Add purple team lab scenarios, detections, and setup workflow"
git push origin main
```

---

## Automation

PowerShell scripts support the workflow, including running Atomic Red Team tests, exporting EVTX logs, and organizing repeatable lab steps.

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
- [ ] Add an architecture diagram
- [ ] Add more scenarios mapped to ATT&CK
- [ ] Include a detection coverage matrix

---

## Notes

- Sysmon must be installed with Administrator privileges
- Atomic Red Team requires the correct atomics folder path to be configured
- Chainsaw requires Sigma rules to detect events in logs
- Logs are exported in EVTX format for analysis and detection validation