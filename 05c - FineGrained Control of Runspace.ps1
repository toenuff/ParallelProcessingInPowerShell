$code={
    $t = "blah"
    "T is set"
}
$ps1 = [PowerShell]::Create().AddScript($code)

$handle1 = $ps1.BeginInvoke()

while (!$handle1.IsCompleted -or !$handle2.iscompleted) {
    Start-Sleep -Milliseconds 500
}

$ps1.EndInvoke($handle1)


# Add another script that displays the value of the variable set int the first script
$ps1.AddScript({"T is $t"}) |out-null

$handle1 = $ps1.BeginInvoke()

while (!$handle1.IsCompleted -or !$handle2.iscompleted) {
    Start-Sleep -Milliseconds 500
}

$ps1.EndInvoke($handle1)


$ps1.Runspace.Close()
$ps1.Dispose()