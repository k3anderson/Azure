<#
.SYNOPSIS
Use script to create certificate that can be used to authenticate with Azure Apps
New-PnPAzureCertificate - https://docs.microsoft.com/en-us/powershell/module/sharepoint-pnp/new-pnpazurecertificate?view=sharepoint-ps
.INPUTS
$CommonName
$PFXName
$CERName
$YearsValid
$Password
.OUTPUTS
None
.NOTES
Version:         1.0
Author:          Kyle Anderson
Creation Date:   26 Sep 2020
Required Module: SharePointPnPPowerShellOnline
#>

#Adjust variables to suit your needs
$CommonName = "<Common Name>"
$PFXName = "<PFX Name>.pfx"
$CERName = "<Cer Name>.cer"
$YearsValid = 10
$Password = ConvertTo-SecureString -String '<Password>' -AsPlainText -Force

New-PnPAzureCertificate -CommonName $CommonName -OutCert $CERName -OutPfx $PFXName -ValidYears $YearsValid -CertificatePassword $Password