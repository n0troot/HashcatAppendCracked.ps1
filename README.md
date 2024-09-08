# HashcatAppendCracked.ps1
Takes the hashcat output and using a cracked passwords list appends the passwords to the usernames


# How to Use
Put your Hashcat DCSync output and your cracked passwords(NTLM:password) list like the following:
$results = Get-Content .\Cracked.txt

$list = Get-Content .\DCSync.txt

Run the script and have fun :)
