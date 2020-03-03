. "$( Split-Path $PSScriptRoot -Parent )/env.ps1"

New-Item $BUILD_DIR -ItemType Directory -Force > $null
Copy-Item "$APP_DIR/*.ps*1" $BUILD_DIR -Recurse -Force
