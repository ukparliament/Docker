<#
.SYNOPSIS
Gets artifact from blob storage.

.DESCRIPTION
Azure Powershell script to get artifacts from a blob storage in build and release process.

.PARAMETER ResourceGroupName 
The resource group name of the azure storage account.

.PARAMETER StorageAccountName
The blob storage account name.

.PARAMETER Container
Name of the container in storage account.

.PARAMETER Blob
Name of the blob in container.

.PARAMETER Destination
Destination path of the blob file.

.NOTES
This script is for use as a part of deployment in VSTS only.
#>

Param(
    [Parameter(Mandatory=$true)] [string] $ResourceGroupName,
    [Parameter(Mandatory=$true)] [string] $StorageAccountName,
    [Parameter(Mandatory=$true)] [string] $Container,
    [Parameter(Mandatory=$true)] [string] $Blob,
    [Parameter(Mandatory=$true)] [string] $Destination  
)

$StorageAccountKeys = Get-AzureRmStorageAccountKey -ResourceGroupName $ResourceGroupName -Name $StorageAccountName

$StorageAccountPrimaryKey = $StorageAccountKeys[0].Value

$AzureStorageContext = New-AzureStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccountPrimaryKey

Get-AzureStorageBlobContent -Context $AzureStorageContext -Blob $Blob -Container $Container -Destination $Destination/$Blob