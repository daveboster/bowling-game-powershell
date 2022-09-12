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
    It 'Records a gutter game' {
        $scoreCard = Get-Bowling
        for($i = 0; $i -lt 20; $i++) {
            Bowling-Roll -scoreCard $scoreCard -pins 0
        }
        $scoreCard.score | Should -Be 0
    }
    It 'Records a 3 and a 4 and returns a score of 7' {
        $scoreCard = Get-Bowling
        Bowling-Roll -scoreCard $scoreCard -pins 3
        Bowling-Roll -scoreCard $scoreCard -pins 4
        $scoreCard.score | Should -Be 7
    }
    It 'Rolling will not let you roll more than 10 pins' {
        $scoreCard = Get-Bowling
        { Bowling-Roll -scoreCard $scoreCard -pins 11 } | Should -Throw
    }
    It 'Rolling will not let you roll less than 0 pins' {
        $scoreCard = Get-Bowling
        { Bowling-Roll -scoreCard $scoreCard -pins (-1) } | Should -Throw
    }
    It 'Rolling will not let you knock down more than 10 pins per frame' {
        $scoreCard = Get-Bowling
        Bowling-Roll -scoreCard $scoreCard -pins 7
        {Bowling-Roll -scoreCard $scoreCard -pins 7} | Should -Throw
    }
    It 'Rolling will not let you knock down more than 10 pins for the second frame' {
        $scoreCard = Get-Bowling
        Bowling-Roll -scoreCard $scoreCard -pins 3
        Bowling-Roll -scoreCard $scoreCard -pins 3
        Bowling-Roll -scoreCard $scoreCard -pins 7
        {Bowling-Roll -scoreCard $scoreCard -pins 7} | Should -Throw
    }
    It 'Rolling a spare in the first frame will be correctly scored in the second frame' {
      $scoreCard = Get-Bowling
      Bowling-Roll -scoreCard $scoreCard -pins 8
      Bowling-Roll -scoreCard $scoreCard -pins 2
      Bowling-Roll -scoreCard $scoreCard -pins 7
      Bowling-Roll -scoreCard $scoreCard -pins 1
      $scoreCard.score | Should -Be(25)
    }
    It 'Rolling two spares in a row, should be correctly scored in the third frame' {
      $scoreCard = Get-Bowling
      # Frame 1 - Spare
      Bowling-Roll -scoreCard $scoreCard -pins 8
      Bowling-Roll -scoreCard $scoreCard -pins 2
      # Frame 2 - Spare
      Bowling-Roll -scoreCard $scoreCard -pins 7
      $scoreCard.score | Should -Be(24)
      Bowling-Roll -scoreCard $scoreCard -pins 3
      # Frame 3 - No Spare
      Bowling-Roll -scoreCard $scoreCard -pins 7
      $scoreCard.score | Should -Be(41)
      Bowling-Roll -scoreCard $scoreCard -pins 2
      $scoreCard.score | Should -Be(43)
    }
}
