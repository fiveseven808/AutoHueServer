IfExist, C:\Program Files (x86)\WinHue 3\whc.exe
	WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"
IfExist, C:\Program Files\WinHue 3\whc.exe
	WHClocation = "C:\Program Files\WinHue 3\whc.exe"

runwait %WHClocation% -l:1 -on:true -bri:2 
runwait %WHClocation% -l:2 -on:false -bri:1 
runwait %WHClocation% -l:5 -on:true -bri:25 -sat:109 -ct:334 
runwait %WHClocation% -l:6 -on:true -bri:1 
runwait %WHClocation% -l:7 -on:true -bri:1 -sat:1 -ct:384 
runwait %WHClocation% -l:8 -on:true -bri:1 -sat:1 -ct:381 
runwait %WHClocation% -l:9 -on:false -bri:144 -sat:179 -ct:413 
runwait %WHClocation% -l:10 -on:false -bri:144 -sat:145 -ct:369 
runwait %WHClocation% -l:11 -on:false -bri:1 -sat:197 -ct:439 
