$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Hello-World" {

    It 'Says Hello' {
        Mock Write-Host  { return 1;}

        $actual = Hello-World

        $actual | Should Be 1
    }

}
