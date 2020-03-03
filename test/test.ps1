. "$( Split-Path $PSScriptRoot -Parent )/env.ps1"

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$global:PesterDebugPreference_ShowFullErrors = $true

"[PSModulePath]" | Write-Host
$env:PSModulePath | Write-Host

# Install Pester if needed
$pester = Get-Module Pester -ListAvailable -ErrorAction SilentlyContinue
if ( ! $pester -or $pester.Version.Major -lt 4 ) {
    Install-Module Pester -Force -Scope CurrentUser
}
"[Pester]" | Write-Host
Get-Module Pester -ListAvailable | Format-List | Out-String | Write-Host

# Import our module
Get-Module "$MODULE_NAME" | Remove-Module
Import-Module "$SRC_MODULE_DIR/$MODULE_NAME.psd1" -Force

# Run tests
$res = Invoke-Pester -Script $SRC_MODULE_DIR -PassThru
if ($res.FailedCount -gt 0) {
    "$( $res.FailedCount ) tests failed." | Write-Host
    exit 1
}
