$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Hello-World" {

    It 'Says "Hello World!"' {
        $actual = Hello-World 6>&1

        $actual | Should -Be "Hello World!"
    }

    It 'Uses Write-Host' {
        Mock Write-Host {}

        Hello-World

        Assert-MockCalled Write-Host -Times 1
    }

}
