#!/bin/bash
# Description: Automated CIS Level 1 Baseline for Linux Servers
# Environment: Zero-Trust Hardening Lab

echo "[*] Starting Linux CIS Hardening Baseline..."

# 1. SSH Hardening
echo "[*] Hardening SSH configuration..."
sed -i 's/^#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
systemctl restart sshd

# 2. File System Permissions
echo "[*] Securing temporary directories..."
cat << 'EOF' >> /etc/fstab
tmpfs /tmp tmpfs defaults,rw,nosuid,nodev,noexec,relatime 0 0
tmpfs /var/tmp tmpfs defaults,rw,nosuid,nodev,noexec,relatime 0 0
tmpfs /dev/shm tmpfs defaults,rw,nosuid,nodev,noexec,relatime 0 0
EOF
mount -o remount /tmp
mount -o remount /var/tmp
mount -o remount /dev/shm

# 3. Audit & Logging
echo "[*] Installing and enabling auditd..."
apt-get install -y auditd audispd-plugins
systemctl enable auditd
systemctl start auditd

echo "[+] CIS Baseline Hardening Complete."
