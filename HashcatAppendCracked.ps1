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
             Write-Output "$line+$rs"
         }
     }
}
