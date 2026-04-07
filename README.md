# PurpleTeamLab1

> A hands-on Windows purple teaming lab for simulating attacker behavior, collecting host telemetry, validating detections, and documenting findings.

---

## Table of Contents

- [Overview](#overview)
- [Tools Used](#tools-used)
- [Skills Demonstrated](#skills-demonstrated)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Attack Scenarios](#attack-scenarios)
- [Detection Engineering](#detection-engineering)
- [MITRE ATT&CK Mapping](#mitre-attck-mapping)
- [Lab Setup](#lab-setup)
- [Screenshots](#screenshots)
- [Lessons Learned](#lessons-learned)
- [Future Improvements](#future-improvements)
- [Notes](#notes)

---

## Overview

PurpleTeamLab1 is a beginner-to-job-ready home lab built to demonstrate practical defensive security skills. The project uses Windows logging, Sysmon, PowerShell logging, Atomic Red Team, Chainsaw, Sigma-based detection engineering, and ATT&CK-aligned documentation to simulate common attacker techniques and analyze the resulting telemetry.

### Full Purple Team Workflow

```
1. Simulate a technique
2. Generate telemetry
3. Export logs
4. Hunt through evidence
5. Write or validate detections
6. Map activity to MITRE ATT&CK
7. Document findings and improvements
```

---

## Tools Used

| Tool | Purpose |
|------|---------|
| Windows | Lab host operating system |
| Sysmon | Host telemetry and event logging |
| PowerShell Logging | Script block and module visibility |
| Atomic Red Team | Safe adversary technique simulation |
| Chainsaw | EVTX log hunting and detection validation |
| Sigma | Detection rule authoring |
| VS Code | Editing, scripting, and documentation |
| Git / GitHub | Version control and project presentation |

---

## Skills Demonstrated

- Defensive security analysis
- Threat simulation
- Detection engineering
- Windows event log analysis
- EVTX hunting
- PowerShell-based automation
- Incident-style reporting
- MITRE ATT&CK mapping
- GitHub project documentation

---

## Architecture

PurpleTeamLab1 follows a straightforward purple team workflow:

```
Atomic Red Team
      │
      ▼
 Windows Host
      │
      ▼
Sysmon / PowerShell Logging
      │
      ▼
   EVTX Logs
      │
      ▼
Chainsaw / Sigma Rules
      │
      ▼
Reports / ATT&CK Mapping / GitHub
```

**Atomic Red Team** simulates adversary behavior on a **Windows host**. **Sysmon** and **PowerShell logging** capture telemetry exported as **EVTX**. **Chainsaw** and **Sigma rules** then hunt through logs and validate detections. Results are documented through reports, screenshots, and ATT&CK mapping.

---

## Project Structure

```text
PurpleTeamLab1/
├── attack-scenarios/
│   ├── scenario-1-suspicious-powershell-execution.md
│   ├── scenario-2-credential-access.md
│   ├── scenario-3-persistence.md
│   ├── scenario-4-scheduled-task.md
│   └── scenario-5-system-discovery.md
├── detections/
│   ├── hunts/
│   │   └── chainsaw-hunts.md
│   └── sigma/
│       ├── credential_access.yml
│       ├── persistence_runkey.yml
│       └── powershell.yml
├── docs/
│   ├── architecture.md
│   └── detection-coverage-matrix.md
├── logs/
│   └── evtx/
│       ├── powershell.evtx
│       ├── security.evtx
│       └── sysmon.evtx
├── mappings/
│   └── sigma-event-logs-all.yml
├── mitre-mapping/
│   └── attack-techniques.md
├── reports/
│   ├── detection-report-1.md
│   ├── detection-report-2.md
│   └── detection-report-3.md
├── screenshots/
│   ├── hunts/
│   │   └── chainsaw-hunt-output.png
│   └── setup/
│       ├── architecture-diagram.png
│       ├── atomic-execution-clean.png
│       ├── atomic-techniques-list.png
│       ├── chainsaw-hunt-run.png
│       └── project-structure.png
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

### Scenario 1 — Suspicious PowerShell Execution
**MITRE ATT&CK:** `T1059.001` – PowerShell

Focus areas: suspicious PowerShell execution, encoded or obfuscated commands, command-line visibility in Sysmon and PowerShell logs.

### Scenario 2 — Credential Access Simulation
**MITRE ATT&CK:** `T1003` – OS Credential Dumping

Focus areas: suspicious process execution, command-line indicators tied to credential access behavior, visibility into potentially high-risk activity.

### Scenario 3 — Persistence via Startup / Registry
**MITRE ATT&CK:** `T1547` – Boot or Logon Autostart Execution

Focus areas: Registry Run key abuse, startup persistence behavior, visibility into suspicious autorun changes.

### Scenario 4 — Scheduled Task Creation
**MITRE ATT&CK:** `T1053` – Scheduled Task/Job

Focus areas: suspicious scheduled task creation, process visibility involving `schtasks.exe`, persistence-related task behavior.

### Scenario 5 — System Discovery
**MITRE ATT&CK:** `T1082` – System Information Discovery

Focus areas: host discovery commands, safe Atomic Red Team simulation, visibility into enumeration behavior through Sysmon and PowerShell logs.

---

## Detection Engineering

### Sigma Rules

Sigma rules are currently included for:

- Suspicious PowerShell execution
- Credential access-related process behavior
- Persistence through Run keys

Each detection is paired with scenario documentation describing:

| Field | Description |
|-------|-------------|
| **Objective** | What the detection is designed to catch |
| **Expected Logs** | Which event sources are relevant |
| **Detection Logic** | How the rule works |
| **Result** | Whether the detection fired as expected |
| **Improvement Ideas** | Notes for tuning and future expansion |

### Chainsaw Hunts

Chainsaw is used to hunt exported EVTX logs and validate telemetry generated from Atomic Red Team execution. Current hunt areas include:

- PowerShell-related activity
- Credential access indicators
- Persistence-related behavior
- Scenario expansion for discovery and scheduled task activity

Hunt notes are documented in `detections/hunts/chainsaw-hunts.md`.

---

## MITRE ATT&CK Mapping

| Scenario | Technique ID | Technique Name |
|----------|-------------|----------------|
| Suspicious PowerShell Execution | T1059.001 | PowerShell |
| Credential Access Simulation | T1003 | OS Credential Dumping |
| Persistence via Registry Run Key | T1547 | Boot or Logon Autostart Execution |
| Scheduled Task Creation | T1053 | Scheduled Task/Job |
| System Discovery | T1082 | System Information Discovery |

A full detection coverage matrix tracking ATT&CK technique coverage, telemetry sources, detection files, linked reports, and implementation status is available in `docs/detection-coverage-matrix.md`.

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

Install Sysmon:

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

Enable Script Block Logging and Module Logging:

```powershell
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -Name "EnableScriptBlockLogging" -Value 1

New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging" -Force
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNames" -Force

Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging" -Name "EnableModuleLogging" -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNames" -Name "*" -Value "*"
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
.\archive\Chainsaw.exe hunt --mapping .\mappings\sigma-event-logs-all.yml --sigma .\detections\sigma\ --output .\logs\samples\ .\logs\evtx\
```

### 10. Commit and Push to GitHub

```bash
git add .
git commit -m "Update purple team lab with hunts, docs, and expanded scenarios"
git push origin main
```

---

## Screenshots

```text
screenshots/
├── setup/
│   ├── architecture-diagram.png
│   ├── atomic-execution-clean.png
│   ├── atomic-techniques-list.png
│   ├── chainsaw-hunt-run.png
│   └── project-structure.png
└── hunts/
    └── chainsaw-hunt-output.png
```

Visuals cover: project structure, architecture, Atomic Red Team technique enumeration and execution, Chainsaw hunt execution, and hunt output.

---

## Lessons Learned

- Windows telemetry becomes much more valuable when Sysmon and PowerShell logging are enabled
- Detection engineering requires both telemetry visibility and tuning
- Safe attacker simulation helps connect red-team behavior to blue-team visibility
- Chainsaw hunting adds useful validation beyond simple rule creation
- Good documentation makes technical work easier to communicate in interviews

---

## Future Improvements

- [ ] Add Splunk or Elastic for dashboarding and search
- [ ] Expand Chainsaw-based hunting
- [ ] Tune detections to reduce false positives
- [ ] Add an architecture diagram
- [ ] Add more scenarios mapped to ATT&CK
- [ ] Add additional Sigma rules for Scenario 4 and Scenario 5
- [ ] Add screenshot-based rule demonstrations for detections

---

## Notes

> - Sysmon must be installed with Administrator privileges
> - Atomic Red Team requires the correct atomics folder path to be configured
> - Chainsaw requires Sigma rules and a mapping file for log interpretation
> - Logs are exported in EVTX format for hunting and detection validation
> - Some Atomic tests may fail or be blocked depending on local protections, permissions, or missing tools