$rawContent = Get-Content .\day2\puzzle.txt
$counter = 0

foreach ($report in $rawContent) {
    
    $safe=$increase=$decrease = $true

    $levels = $report -split ' '

    for ($i = 0; $i -lt $levels.Length-1; $i++) {

        # si la distance entre 2 levels n'est pas entre 1 et 3, c'est unsafe
        [int]$distance = [System.Math]::Abs($levels[$i] - $levels[$i+1])
        if ($distance -notin 1..3) { $safe = $false }

        # si entre 2 levels c'est ni une augmentation ni une diminution, c'est unsafe
        if (([int]$levels[$i] - [int]$levels[$i+1]) -eq 0) { $safe = $false }
        
        # si la direction reste pas un increase ni un decrease depuis le level précédent, c'est unsafe
        if ([int]$levels[$i] -gt [int]$levels[$i+1]) { $increase = $false }
        if ([int]$levels[$i] -lt [int]$levels[$i+1]) { $decrease = $false }
        if (!$increase -and !$decrease)              { $safe = $false }
    }

    # si c'est safe, on perd pas le compte !
    if ($safe) { $counter++ } 
}

Write-Output "Reponse 1 = $counter"