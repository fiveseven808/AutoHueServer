IfExist, C:\Program Files (x86)\WinHue 3\whc.exe
	WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"
IfExist, C:\Program Files\WinHue 3\whc.exe
	WHClocation = "C:\Program Files\WinHue 3\whc.exe"

run %WHClocation% -l:1 -on:true -bri:254 
run %WHClocation% -l:2 -on:true -bri:254 
runwait %WHClocation% -l:5 -on:true -bri:254 -x:0.4423 -y:0.4059 -sat:117 
run %WHClocation% -l:6 -on:true -bri:1 
run %WHClocation% -l:7 -on:true -bri:254 -sat:1 -ct:343 
run %WHClocation% -l:8 -on:true -bri:254 -sat:1 -ct:343 
run %WHClocation% -l:9 -on:true -bri:254 -x:0.4423 -y:0.4059 -sat:117 
runwait %WHClocation% -l:10 -on:true -bri:254 -x:0.4423 -y:0.4059 -sat:117 
run %WHClocation% -l:11 -on:true -bri:254 -x:0.4423 -y:0.4059 -sat:117 
run %WHClocation% -l:12 -on:true -bri:254 
run %WHClocation% -l:13 -on:true -bri:254 -sat:148 -ct:372 
run %WHClocation% -l:14 -on:true -bri:254 
runwait %WHClocation% -l:15 -on:true -bri:191 -sat:1 -ct:366 
