BeforeAll {
    . $PSScriptRoot/Get-Bowling.ps1
}

Describe 'Get-Bowling' {
    It 'returns a bowling-game scorecard' {
        $scoreCard = Get-Bowling
        $scoreCard | Should -Not -Be $null
    }
}

Describe 'Bowling-Roll' {
    It 'Can roll a ball' {
        $scoreCard = Get-Bowling
        Bowling-Roll -scoreCard $scoreCard
    }

    It 'Roll a ball returns a scorecard' {
        $scoreCard = Get-Bowling
        $updatedScoreCard = Bowling-Roll -scoreCard $scoreCard
        $updatedScoreCard | Should -Be $scoreCard
    }
}