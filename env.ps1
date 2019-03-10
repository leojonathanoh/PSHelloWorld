$ErrorActionPreference = 'Stop'

$BASE_DIR = $PSScriptRoot
$MODULE_NAME = (Get-Item $BASE_DIR).Name
$APP_DIR = "$BASE_DIR/app"
$BUILD_DIR = "$BASE_DIR/build/psgallery/$MODULE_NAME"
$TEST_DIR = "$BASE_DIR/test"
$RELEASE_DIR = "$BASE_DIR/release"
$PUBLISH_DIR = "$BASE_DIR/publish"

$MODULE_VERSION = '0.0.1'
$MODULE_MANIFEST_FILE = "$APP_DIR/$MODULE_NAME.psd1"

