---
category: Playbook
severity: Critical
tlp: AMBER
mitre_id: T1078.004
actor: N/A
compliance_refs: CIS v8: 6.3 | NIST 800-53: IA-2 | PCI DSS: 8.4
last_updated: 2026-04-24
---

# Identity Access: MFA and Conditional Access

## Overview
This playbook outlines the Zero-Trust identity perimeter, emphasizing mandatory Multi-Factor Authentication (MFA) and context-aware access policies.

## Conditional Access Policies
1. **Require MFA for all Administrative Access**: Any role with privileged access (Global Admin, Domain Admin, etc.) MUST prompt for MFA regardless of location.
2. **Block Legacy Authentication**: Block protocols that do not support modern auth (POP, IMAP, legacy SMTP).
3. **Sign-in Risk-Based Policies**: If Azure AD / Entra ID detects a high-risk sign-in (e.g., impossible travel), enforce password reset and MFA, or block access entirely.

> [!IMPORTANT]
> **The Inquisitor's Veto**
> *Is this recommendation the BEST outcome, or merely the most obvious one?*
> Enforcing MFA is obvious, but *how* it's enforced matters. Adversaries bypass weak MFA via prompt bombing (MFA fatigue) or AiTM (Adversary-in-the-Middle) phishing. 
> **Refined Recommendation**: Enforce *Phishing-Resistant MFA* (FIDO2 keys or Windows Hello for Business) for all Tier 0 access.

## Verification
- Audit sign-in logs to ensure no successful legacy authentication attempts are present.
