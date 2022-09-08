BeforeAll {
    . $PSScriptRoot/Get-Bowling.ps1
}

Describe 'Get-Bowling' {
    It 'successfully start bowling game with no parameters' {
        Get-Bowling
    }
}