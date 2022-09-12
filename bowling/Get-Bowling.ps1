function Get-Bowling () {
    return @{score=0; prevFrameScore=0; frameScore=0; ball=1; frame=1;};
}

function Bowling-Roll ($scoreCard, $pins) {
    if($pins -gt 10) {
        throw "Cannot roll more than ten pins";
    }
    if($pins -lt 0) {
        throw "Cannot roll less than zero pins";
    }
    switch ($scoreCard.ball) {
        1 {
            $scoreCard.ball += 1;
            $scoreCard.frameScore = $pins;
            if ($scoreCard.prevFrameScore -eq 10 -and $scoreCard.frame -ne 10) {
              $scoreCard.score += $pins;
            }
         }
        2 {
            if ($scoreCard.frameScore + $pins -gt 10) {
                throw "Total pins in a frame can not exceed 10";
            }
            $scorecard.ball = 1;
            $scoreCard.prevFrameScore = $scoreCard.frameScore + $pins;
            $scoreCard.frame += 1;
        }
    }
    $scoreCard.score += $pins;
    return $scoreCard;
}
