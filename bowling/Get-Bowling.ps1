function Get-Bowling () {
    return @{score=0};
}

function Bowling-Roll ($scoreCard, $pins) {
    if($pins -gt 10) {
        throw "Cannot roll more than ten pins"
    }

    $scoreCard.score += $pins
    return $scoreCard
}