$code={start-sleep 2;"hello"}
$ps1 = [PowerShell]::Create().AddScript($code)

$handle1 = $ps1.BeginInvoke()

while (!$handle1.IsCompleted) {
    '.'
    Start-Sleep -Milliseconds 500
}

$ps1.EndInvoke($handle1)
$ps1.Runspace.Close()
$ps1.Dispose()