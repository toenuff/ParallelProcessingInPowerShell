param(
    [Parameter(Mandatory=$true)]
    [string[]] $computername
)
BEGIN {
    foreach ($computer in $computername) {
        $rand = Get-Random -Maximum 4
        sleep $rand
        new-object psobject -Property @{
            Computer=$computer
            Number=$rand
        }
    }
}