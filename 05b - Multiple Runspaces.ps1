$code={start-sleep 4;"hello"}
$ps1 = [PowerShell]::Create().AddScript($code)
$code={start-sleep 2;"hello"}
$ps2 = [PowerShell]::Create().AddScript($code)

Get-Process powershell_ise |select -ExpandProperty threads |measure |select -ExpandProperty count
$handle1 = $ps1.BeginInvoke()
$handle2 = $ps2.BeginInvoke()

while (!$handle1.IsCompleted -or !$handle2.iscompleted) {
    Get-Process powershell_ise |select -ExpandProperty threads |measure |select -ExpandProperty count
    Start-Sleep -Milliseconds 500
}
$ps1.EndInvoke($handle1)
$ps1.Runspace.Close()
$ps1.Dispose()

$ps2.EndInvoke($handle2)
$ps2.Runspace.Close()
$ps2.Dispose()

Get-Process powershell_ise |select -ExpandProperty threads |measure |select -ExpandProperty count