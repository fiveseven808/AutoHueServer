IfExist, C:\Program Files (x86)\WinHue 3\whc.exe
	WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"
IfExist, C:\Program Files\WinHue 3\whc.exe
	WHClocation = "C:\Program Files\WinHue 3\whc.exe"

run %WHClocation% -l:1 -on:false -bri:2 
run %WHClocation% -l:2 -on:false -bri:1 
runwait %WHClocation% -l:5 -on:true -bri:1 -sat:195 -ct:435 
run %WHClocation% -l:6 -on:true -bri:1 
run %WHClocation% -l:7 -on:false -bri:1 -sat:1 -ct:381 
run %WHClocation% -l:8 -on:false -bri:1 -sat:1 -ct:381 
run %WHClocation% -l:9 -on:false -bri:1 -sat:195 -ct:435 
runwait %WHClocation% -l:10 -on:false -bri:1 -sat:195 -ct:435 
run %WHClocation% -l:11 -on:false -bri:1 -sat:195 -ct:435 
run %WHClocation% -l:12 -on:false -bri:254 
