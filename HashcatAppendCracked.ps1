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
foreach ($line in $list) {
     $ln = (cut $line -delimiter ':')[-4]
     foreach ($rs in $results) {
         if ($rs.StartsWith($ln)) {
             $rs1 = ($rs -split ":")[1]
             if ($line -match "(status=Enabled)") {
                 $line = $line.Replace("(status=Enabled)","");
                 Write-Output "$line$rs1"
             } elseif ($line -match "(status=Disabled)") {
                 $line = $line.Replace("(status=Disabled)","");
                 Write-Output "$line$rs1"
             } else {
                 Write-Output "$line$rs1"
             }
          }
     }
 }
