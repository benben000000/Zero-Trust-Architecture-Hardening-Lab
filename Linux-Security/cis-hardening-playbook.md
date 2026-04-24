---
category: Playbook
severity: High
tlp: AMBER
mitre_id: T1078.003
actor: N/A
compliance_refs: CIS v8: 4.1, 5.1 | NIST 800-53: CM-6
last_updated: 2026-04-24
---

# Linux Server CIS Baseline Hardening

## Overview
This document outlines the standard CIS Level 1 and Level 2 baselines applied to Linux servers in the Zero-Trust environment.

## Key Hardening Measures
1. **SSH Hardening**:
   - Disable root login (`PermitRootLogin no`)
   - Disable password authentication (`PasswordAuthentication no`)
   - Restrict access to specific PAM groups.
2. **File System Permissions**:
   - Secure `/tmp`, `/var/tmp`, and `/dev/shm` with `nodev, nosuid, noexec` mount options.
3. **Audit & Logging**:
   - Enable `auditd` to track privileged execution (sudo usage) and unauthorized access attempts.

> [!WARNING]
> **Regulatory Collision Check**
> *Does this action satisfy applicable regulations?*
> Implementing strong SSH controls and audit logging satisfies PCI DSS v4.0.1 requirements 8.2 (Access Control) and 10.2 (Audit Logs).

## Automation
For automated deployment, refer to the bash implementation in `scripts/baseline.sh`.
