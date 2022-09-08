function Get-Bowling () {
    return @{score=0};
}

function Bowling-Roll ($scoreCard, $pins) {
    $scoreCard.score += $pins
    return $scoreCard;
}