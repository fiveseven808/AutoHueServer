IfExist, C:\Program Files (x86)\WinHue 3\whc.exe
	WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"
IfExist, C:\Program Files\WinHue 3\whc.exe
	WHClocation = "C:\Program Files\WinHue 3\whc.exe"

runwait %WHClocation% -g:1 -on:true -bri:1 -sat:1 -ct:381 -tt 100
runwait %WHClocation% -g:2 -on:false -bri:1 -sat:197 -ct:439 -tt 100
runwait %WHClocation% -g:3 -on:true -bri:1 -tt 100
runwait %WHClocation% -g:4 -on:true -bri:2 -tt 100
runwait %WHClocation% -g:5 -on:false -bri:254 -tt 100
