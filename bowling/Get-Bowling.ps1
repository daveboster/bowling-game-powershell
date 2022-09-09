function Get-Bowling () {
    return @{score=0};
}

function Bowling-Roll ($scoreCard, $pins) {
    Write-Output "Pins : $pins"
    if($pins -gt 10) {
        throw "Cannot roll more than ten pins"
    }
    if($pins -lt 0) {
        throw "Cannot roll less than zero pins"
    }

    $scoreCard.score += $pins
    return $scoreCard
}