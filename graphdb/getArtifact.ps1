$storageAccountKeys = Get-AzureRmStorageAccountKey -ResourceGroupName $resourceGroupName -Name $storageAccountName

$storageAccountPrimaryKey = $storageAccountKeys[0].Value

$azureStorageContext = New-AzureStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $storageAccountPrimaryKey

Get-AzureStorageBlobContent -Context $azureStorageContext -Blob $blob -Container $container -Destination $destination/$blob