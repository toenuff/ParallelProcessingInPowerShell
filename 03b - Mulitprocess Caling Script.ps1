&  'C:\Dropbox\Presentations\Parallel\Summit 2014\03a - MultiprocessScriptToRun.ps1' -computername (0..10)





















(0..5) |%{
    Start powershell -ArgumentList @('-noexit','-noprofile','-file','"C:\dropbox\presentations\parallel\Summit 2014\03a - MultiprocessScriptToRun.ps1"','-computername',$_)
}