param(
    [string] [Parameter(Mandatory=$true)] $PrimaryLocation,
    [string] [Parameter(Mandatory=$true)] $Environment,
    [string] [Parameter(Mandatory=$true)] $client_name
)
"SearchIndex=gco-index-$PrimaryLocation-$Environment-$ClientName" >> $env:GITHUB_OUTPUT
"SemanticIndex=$ClientName-data-semantic-configuration" >> $env:GITHUB_OUTPUT