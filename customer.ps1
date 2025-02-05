param(
    [string] [Parameter(Mandatory=$true)] $PrimaryLocation,
    [string] [Parameter(Mandatory=$true)] $Environment,
    [string] [Parameter(Mandatory=$true)] $client_name, 
    [string] [Parameter(Mandatory=$true)] $openaiName,
    [string] [Parameter(Mandatory=$true)] $openai_model
)

#[string] [Parameter(Mandatory=$true)] $connectionString,
#[string] [Parameter(Mandatory=$true)] $openai_apiKey,
#[string] [Parameter(Mandatory=$true)] $AzureAIScvMSAcct_key

$ErrorActionPreference = 'Stop'
$regions = @{
    "eastus" = "us"
    "eastus2" = "us"
    "centralus" = "us"
}
$regionShortName = $regions[$PrimaryLocation]

# Data Resource Group Name
$data_rg = "rg-$Environment-$PrimaryLocation-data"
$rgExists = $(az group exists --name $data_rg)
if ($rgExists -eq 'false') {
    Write-Error "Resource group does not exist." -ErrorAction Stop
}
write-output "Data Resource Group: $data_rg"


# searchService
$application_rg = "rg-$Environment-$region-application"
$searchServiceName = $(az search service list --resource-group $application_rg --query "[?contains(name, 'srch-$region-$env')].name" --output tsv)
write-output "Search service: $searchServiceName"
$SearchAPIKey = $(az search admin-key show --resource-group $data_rg --service-name $searchServiceName) | ConvertFrom-Json | Select-Object -ExpandProperty primaryKey
$headers = @{"Content-Type" = "application/json"
             "api-key"      = $SearchAPIKey }
$uri = "https://$searchServiceName.search.windows.net"


#KeyVault
$keyVaultName = $(az keyvault list --resource-group $data_rg --query "[?contains(name, 'fgco$($regionShortName)kv')].name" --output tsv)
$keyVaultKeyName = $(az keyvault key list --vault-name  $keyVaultName --query "[?contains(name, 'fgco$($regionShortName)keySearchSvc')].name" --output tsv) 

#OpenAI 
$openaiName = $(az cognitiveservices account list --resource-group $application_rg --query "[?contains(kind, 'OpenAI')].name" --output tsv) 
write-output "OpenAI: $openaiName"

#Managed identity
$userAssignedIdentity = $(az identity list --resource-group $data_rg --query "[?contains(name, 'fgco$($regionShortName)mi')].id" --output tsv) 
write-output "MI: $userAssignedIdentity"

#Storage Account
$sa = $(az storage account --resource-group $data_rg --query "[?contains(name, 'fgco$($regionShortName)')].name" --output tsv) 

az storage account show-connection-string --name mystorageaccount --resource-group myResourceGroup --query connectionString --output tsv



#####################
#region CREATE DATA SOURCE
Write-Output "Creating data source for $client_name"
$DS = Get-Content -Path "$PSScriptRoot/data_source.json" -Raw 
$dataSourceDefinition = $DS | ConvertFrom-Json -AsHashTable
$dataSourceDefinition["name"] = "gco-data-$regionShortName-$Environment-$client_name"
$dataSourceDefinition["credentials"].connectionString = "$connectionString"
$dataSourceDefinition["container"].name = "$client_name"
$dataSourceDefinition["encryptionKey"].keyVaultKeyName = "$keyVaultKeyName"
$dataSourceDefinition["encryptionKey"].keyVaultUri = "https://$($keyVaultName).vault.azure.net/"
$dataSourceDefinition["encryptionKey"].identity.userAssignedIdentity = "$userAssignedIdentity"
Write-Host $($dataSourceDefinition | ConvertTo-Json)

<# 
try {
    Invoke-WebRequest -Method 'POST' `
        -Uri "$uri/datasources?api-version=2024-07-01" `
        -Headers $headers `
        -Body (ConvertTo-Json $dataSourceDefinition)
} catch {
    Write-Error $_.ErrorDetails.Message
    throw
} #>
#endregion

#region CREATE INDEX
Write-Output "Creating index"
$INDEX = Get-Content -Path "$PSScriptRoot/index.json" -Raw 
$indexDefinition = $INDEX | ConvertFrom-Json -AsHashTable
$indexDefinition["name"] = "gco-index-$region-$Environment-$client_name"
$indexDefinition["fields"] | Where-Object {$_.name -eq "text_vector"} | ForEach-Object {$_.vectorSearchProfile = "$client_name-azureOpenAi-text-profile"}
$indexDefinition["encryptionKey"].keyVaultKeyName = "$keyVaultKeyName"
$indexDefinition["encryptionKey"].keyVaultUri = "https://$($keyVaultName).vault.azure.net/"
$indexDefinition["encryptionKey"].identity.userAssignedIdentity = "$userAssignedIdentity"
$indexDefinition["semantic"].configurations[0].name = "$client_name-data-semantic-configuration"
$indexDefinition["vectorSearch"].algorithms[0].name = "$client_name-algorithm"
$indexDefinition["vectorSearch"].profiles[0].name = "$client_name-azureOpenAi-text-profile"
$indexDefinition["vectorSearch"].profiles[0].algorithm = "$client_name-algorithm"
$indexDefinition["vectorSearch"].profiles[0].vectorizer = "$client_name-text-vectorizer"
$indexDefinition["vectorSearch"].vectorizers[0].name = "$client_name-text-vectorizerr"
$indexDefinition["vectorSearch"].vectorizers[0].azureOpenAIParameters.resourceUri = "https://$($openaiName).openai.azure.com/"
$indexDefinition["vectorSearch"].vectorizers[0].azureOpenAIParameters.deploymentId = "$openai_model"
$indexDefinition["vectorSearch"].vectorizers[0].azureOpenAIParameters.apiKey = "$openai_apiKey"
$indexDefinition["vectorSearch"].vectorizers[0].azureOpenAIParameters.modelName = "$openai_model"
Write-Host $($indexDefinition | ConvertTo-Json)

<# 
try {
    Invoke-WebRequest -Method 'PUT' `
        -Uri "$uri/indexes?api-version=2024-07-01" `
        -Headers $headers `
        -Body (ConvertTo-Json $indexDefinition)
} catch {
    Write-Error $_.ErrorDetails.Message
    throw
} #>
#endregion


#region CREATE SKILLSET
Write-Output "Creating skillset"
$SKILLSET = Get-Content -Path "$PSScriptRoot/skillset.json" -Raw 
$skillsetDefinition = $SKILLSET | ConvertFrom-Json -AsHashTable
$skillsetDefinition["name"] = "gco-skillset-$regionShortName-$Environment-$client_name"
$skillsetDefinition["cognitiveServices"].key = "$AzureAIScvMSAcct_key"
$skillsetDefinition["skills"] | Where-Object {$_.'@odata.type' -eq "#Microsoft.Skills.Text.AzureOpenAIEmbeddingSkill"} | ForEach-Object {$_.resourceUri = "https://$($openaiName).openai.azure.com/"}
$skillsetDefinition["skills"] | Where-Object {$_.'@odata.type' -eq "#Microsoft.Skills.Text.AzureOpenAIEmbeddingSkill"} | ForEach-Object {$_.apiKey = "$openai_apiKey"}
$skillsetDefinition["skills"] | Where-Object {$_.'@odata.type' -eq "#Microsoft.Skills.Text.AzureOpenAIEmbeddingSkill"} | ForEach-Object {$_.deploymentId = "$openai_model"}
$skillsetDefinition["skills"] | Where-Object {$_.'@odata.type' -eq "#Microsoft.Skills.Text.AzureOpenAIEmbeddingSkill"} | ForEach-Object {$_.modelName = "$openai_model"}
$skillsetDefinition["indexProjections"].selectors[0].targetIndexName = "gco-index-$regionShortName-$Environment-$client_name"
$skillsetDefinition["encryptionKey"].keyVaultKeyName = "$keyVaultKeyName"
$skillsetDefinition["encryptionKey"].keyVaultUri = "https://$($keyVaultName).vault.azure.net/"
$skillsetDefinition["encryptionKey"].identity.userAssignedIdentity = "$userAssignedIdentity"
Write-Host $($skillsetDefinition | ConvertTo-Json)

<# 
try {
    Invoke-WebRequest -Method 'PUT' `
        -Uri "$uri/skillsets?api-version=2024-07-01" `
        -Headers $headers `
        -Body (ConvertTo-Json $skillsetDefinition)
} catch {
    Write-Error $_.ErrorDetails.Message
    throw
} #>
#endregion

#region CREATE INDEXER
Write-Output "Creating indexer"
$INDEXER = Get-Content -Path "$PSScriptRoot/indexer.json" -Raw 
$indexerDefinition = $INDEXER | ConvertFrom-Json -AsHashTable
$indexerDefinition["name"] = "gco-index-$regionShortName-$Environment-$client_name"
$indexerDefinition["dataSourceName"] = "gco-data-$regionShortNamen-$Environment-$client_name"
$indexerDefinition["skillsetName"] = "gco-skillset-$regionShortName-$Environment-$client_name"
$indexerDefinition["targetIndexName"] = "gco-index-$regionShortName-$Environment-$client_name"
$indexerDefinition["encryptionKey"].keyVaultKeyName = "$keyVaultKeyName"
$indexerDefinition["encryptionKey"].keyVaultUri = "https://$($keyVaultName).vault.azure.net/"
$indexerDefinition["encryptionKey"].identity.userAssignedIdentity = "$userAssignedIdentity"
Write-Host $($indexerDefinition | ConvertTo-Json)

<# 
try {
    Invoke-WebRequest -Method 'PUT' `
        -Uri "$uri/indexers?api-version=2024-07-01" `
        -Headers $headers `
        -Body (ConvertTo-Json $indexerDefinition)
} catch {
    Write-Error $_.ErrorDetails.Message
    throw
} #>
#endregion