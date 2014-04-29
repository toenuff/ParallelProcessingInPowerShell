invoke-command -ComputerName ("server1", "server4") -ScriptBlock {hostname} -Credential (Get-Credential)

# invoke-command -computername (gc c:\serverlist.txt) -scriptblock {hostname}
