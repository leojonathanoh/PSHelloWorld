param (
    [Parameter(Mandatory)]
    [string] $ApiKey
)

. "$( Split-Path $PSScriptRoot -Parent )/env.ps1"

Get-Module Hello-World | Remove-Module
Import-Module "$APP_DIR/$MODULE_NAME.psd1"

Publish-Module -Name $MODULE_NAME -NuGetApiKey $ApiKey