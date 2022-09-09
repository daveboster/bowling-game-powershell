function Get-Bowling () {
    return @{score=0; frameScore=0; ball=1};
}

function Bowling-Roll ($scoreCard, $pins) {
    if($pins -gt 10) {
        throw "Cannot roll more than ten pins"
    }
    if($pins -lt 0) {
        throw "Cannot roll less than zero pins"
    }
    switch ($scoreCard.ball) {
        1 {
            $scoreCard.ball += 1;
            $scoreCard.frameScore = $pins
            $scoreCard.score += $scoreCard.frameScore;
         }
        2 {
            if ($scoreCard.frameScore + $pins -gt 10) {
                throw "Total pins in a frame can not exceed 10"
            }
            $scoreCard.frameScore = $pins;
            $scoreCard.score += $scoreCard.frameScore;
            ## Reset Frame
            $scoreCard.frameScore = 0;
            $scorecard.ball = 1;
        }
    }
    return $scoreCard
}