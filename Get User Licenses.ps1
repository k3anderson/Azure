<#
.SYNOPSIS
Get licence details of a user
.INPUTS
User object ID
.OUTPUTS
User licence details
.NOTES
Version:         1.0
Author:          Kyle Anderson
Creation Date:   14 Oct 2020
Required Module: AzureAD
#>

$CSVPath = "C:\Users\Desktop\Licences.csv"
$UserID = "<Object ID>"
$LicenceOutput = @() 

Connect-AzureAD

#Get user licences
$Licences = Get-AzureADUserLicenseDetail -ObjectId $UserID

foreach ($Licence in $Licences) {

    $BuildArray = $Licence.ServicePlans

    $BuildArray | Add-Member -MemberType NoteProperty "ObjectID" -Value $Licence.ObjectID
    $BuildArray | Add-Member -MemberType NoteProperty "SkuId" -Value $Licence.SkuId
    $BuildArray | Add-Member -MemberType NoteProperty "SkuPartNumber" -Value $Licence.SkuPartNumber

    $LicenceOutput += $BuildArray
    
}

#Export List data to CSV
$LicenceOutput | Export-Csv -Path $CSVPath -Force -NoTypeInformation
Write-host -f Green "CSV created and exported"

Disconnect-AzureAD