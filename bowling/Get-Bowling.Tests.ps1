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
    It 'Roll a ball returns a scorecard' {
        $scoreCard = Get-Bowling
        Bowling-Roll -scoreCard $scoreCard
        $scoreCard | Should -Be $scoreCard
    }
    It 'Records a gutter ball and returns a score of 0' {
        $scoreCard = Get-Bowling
        Bowling-Roll -scoreCard $scoreCard -pins 0
        $scoreCard.score | Should -Be 0
    }
    It 'Records a 3 and a 4 and returns a score of 7' {
        $scoreCard = Get-Bowling
        Bowling-Roll -scoreCard $scoreCard -pins 3
        Bowling-Roll -scoreCard $scoreCard -pins 4
        $scoreCard.score | Should -Be 7
    }
}