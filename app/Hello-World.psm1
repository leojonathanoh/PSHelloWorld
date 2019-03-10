$MODULE_BASE_DIR = Split-Path $MyInvocation.MyCommand.Path -Parent
Get-ChildItem "$MODULE_BASE_DIR/*.ps1" -exclude *.Tests.ps1 | % {
    . $_.FullName
}