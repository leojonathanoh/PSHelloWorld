# Interactive script to update the module manifest.

. "$( Split-Path $PSScriptRoot -Parent )/env.ps1"

function Get-FunctionsToExport {
    'Hello-World'
}

$params = @{
    Path = "$MODULE_MANIFEST_FILE"

    RootModule = "$MODULE_NAME.psm1"
    ModuleVersion = $MODULE_VERSION
    Author = $( git config user.name )
    CompanyName  = 'The Oh Brothers'
    Copyright = "Copyright (c) $( Get-Date -Format 'YYYY' ) by $( git config user.name ), licensed under MIT License"
    Description = "A module that prints 'Hello world'!"
    PowerShellVersion = '2.0'
    FunctionsToExport = @( Get-FunctionsToExport )

    #Category = ''
    Tags = 'hello', 'world'
    ProjectUri = "https://github.com/leojonathanoh/$MODULE_NAME"
    IconUri = ''
    LicenseUri = "https://github.com/leojonathanoh/$MODULE_NAME/blob/$MODULE_VERSION/LICENSE"
    ReleaseNotes  = "https://github.com/leojonathanoh/$MODULE_NAME/releases/tag/$MODULE_VERSION"
    Prerelease = ''
}

if (! ( Test-Path -Path $MODULE_MANIFEST_FILE ) ) {
    New-ModuleManifest -Path $MODULE_MANIFEST_FILE -FunctionsToExport $MODULE_NAME
    $content = Get-Content $MODULE_MANIFEST_FILE
    $content | Set-Content $MODULE_MANIFEST_FILE -Encoding utf8
}else {
    Update-ModuleManifest @params
}