---
category: Playbook
severity: High
tlp: AMBER
mitre_id: T1078
actor: N/A
compliance_refs: CIS v8: 4.1, 5.1 | NIST 800-53: AC-2
last_updated: 2026-04-24
---

# Active Directory Tiered Administration Model

## Overview
This playbook provides architectural guidance for implementing a Zero-Trust Tiered Administration model in Active Directory to prevent lateral movement and privilege escalation.

## The Tiering Framework
- **Tier 0 (Identity & Control)**: Domain Controllers, PKI, ADFS, Entra ID Connect.
- **Tier 1 (Enterprise Servers)**: Application servers, databases, virtualization hosts.
- **Tier 2 (Workstations)**: End-user devices and standard workstations.

## Implementation Steps
1. **Create Tiered OUs**: Separate OUs for Tier 0, Tier 1, and Tier 2 assets and admins.
2. **Restrict Logon Rights**: Prevent Tier 0 accounts from logging into Tier 1 or Tier 2 machines (mitigates credential dumping like Pass-the-Hash).
3. **Dedicated Admin Workstations (PAWs)**: Require Privileged Access Workstations for any Tier 0 access.

> [!CAUTION]
> **Adversarial Friction**
> *What does an adversary gain if I am wrong about this assessment?*
> If Tier 0 accounts are allowed to authenticate on Tier 2 systems, a simple phishing attack leading to local credential dumping (e.g., Mimikatz) will result in complete domain compromise. 

## Verification
- Run BloodHound to verify no attack paths exist from Tier 2 to Tier 0.
