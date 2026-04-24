<#
.SYNOPSIS
Creates the foundational Organizational Units (OUs) for the Active Directory Tiered Administration Model.

.DESCRIPTION
This script builds the structural foundation required to separate Tier 0, Tier 1, and Tier 2 assets and identities, a critical prerequisite for Zero-Trust identity management.
#>

$Domain = (Get-ADDomain).DistinguishedName

Write-Host "[*] Creating Tier 0 OUs..." -ForegroundColor Yellow
New-ADOrganizationalUnit -Name "Tier 0" -Path $Domain
New-ADOrganizationalUnit -Name "T0-Admins" -Path "OU=Tier 0,$Domain"
New-ADOrganizationalUnit -Name "T0-Servers" -Path "OU=Tier 0,$Domain"

Write-Host "[*] Creating Tier 1 OUs..." -ForegroundColor Yellow
New-ADOrganizationalUnit -Name "Tier 1" -Path $Domain
New-ADOrganizationalUnit -Name "T1-Admins" -Path "OU=Tier 1,$Domain"
New-ADOrganizationalUnit -Name "T1-Servers" -Path "OU=Tier 1,$Domain"

Write-Host "[*] Creating Tier 2 OUs..." -ForegroundColor Yellow
New-ADOrganizationalUnit -Name "Tier 2" -Path $Domain
New-ADOrganizationalUnit -Name "T2-Admins" -Path "OU=Tier 2,$Domain"
New-ADOrganizationalUnit -Name "T2-Workstations" -Path "OU=Tier 2,$Domain"

Write-Host "[+] Tiered OU structure successfully deployed." -ForegroundColor Green
