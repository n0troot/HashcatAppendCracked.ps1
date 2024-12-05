function cut {
    param(
        [Parameter(ValueFromPipeline=$True)] [string]$inputobject,
        [string]$delimiter='\s+',
        [string[]]$field
    )
    process {
        if ($field -eq $null) { $inputobject -split $delimiter } else {
            ($inputobject -split $delimiter)[$field] }
    }
}

$outputArray = @()

foreach ($line in $list) {
    $ln = (cut $line -delimiter ':')[-4]
    $foundMatch = $false
    
    # Remove status if present
    $cleanLine = $line -replace "\(status=(?:Enabled|Disabled)\)",""
    
    foreach ($rs in $results) {
        if ($rs.StartsWith($ln)) {
            $foundMatch = $true
            $rs1 = ($rs -split ":")[1]
            $outputArray += "$cleanLine$rs1"
            break  # Exit the loop once we find a match
        }
    }
    
    # If no match was found, output the original line (cleaned)
    if (-not $foundMatch) {
        $outputArray += $cleanLine
    }
}

# Output to file
$outputArray | Out-File -FilePath "output.txt" -Encoding UTF8
