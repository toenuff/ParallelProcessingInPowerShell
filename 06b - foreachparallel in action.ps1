(0..20) |ForEach-Parallel -MaxThreads 4{
    $_
    sleep 3
}

(0..50) |ForEach-Parallel -MaxThreads 4{
    $_
    sleep (Get-Random -Minimum 0 -Maximum 5)
}

('server1','server2') |ForEach-Parallel -MaxThreads 2 {
    Test-Connection -ComputerName $_ -Count 1
}


# dirty variables
(0..10) |ForEach-Parallel -MaxThreads 4 {
    $r++
    New-Object psobject -Property @{
        n = $_
        r = $r
    }
}
