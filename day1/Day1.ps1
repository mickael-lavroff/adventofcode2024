$rawContent = (Get-content .\day1\puzzle.txt) -replace '   ', ','

$content = ConvertFrom-Csv -Header @("list1", "list2") -InputObject $rawContent

$sortedList1 = $content.list1 | Sort-Object
$sortedList2 = $content.list2 | Sort-Object

for ($i = 0; $i -lt $content.Count; $i++) {
    $distance += [System.Math]::Abs($sortedList1[$i] - $sortedList2[$i])
}

$reponse1 = $distance

for ($i = 0; $i -lt $sortedList1.Count; $i++) {
    [int]$similarityScore += [int]$sortedList1[$i] * [int]($sortedList2 -match $sortedList1[$i]).Count
}

$reponse2 = $similarityScore

Write-Output @"
Reponse 1 = $reponse1
Reponse 2 = $reponse2
"@