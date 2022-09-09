function Get-Bowling () {
    return @{score=0; ball=1};
}

function Bowling-Roll ($scoreCard, $pins) {
    if($pins -gt 10) {
        throw "Cannot roll more than ten pins"
    }
    if($pins -lt 0) {
        throw "Cannot roll less than zero pins"
    }
    if($scoreCard.ball -eq 1) {
      $scoreCard.ball += 1;
    }
    if($scoreCard.ball -eq 2 -and $scoreCard.score + $pins -gt 10) {
        throw "Total pins in a frame can not exceed 10"
    }
    $scoreCard.score += $pins
    return $scoreCard
}