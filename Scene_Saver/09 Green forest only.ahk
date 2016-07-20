IfExist, C:\Program Files (x86)\WinHue 3\whc.exe
	WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"
IfExist, C:\Program Files\WinHue 3\whc.exe
	WHClocation = "C:\Program Files\WinHue 3\whc.exe"

run %WHClocation% -l:1 -on:false -bri:135 
run %WHClocation% -l:2 -on:false -bri:254 
runwait %WHClocation% -l:5 -on:true -bri:254 -x:0.3789 -y:0.4586 -sat:254 
run %WHClocation% -l:6 -on:false -bri:254 
run %WHClocation% -l:7 -on:false -bri:145 -sat:1 -ct:443 
run %WHClocation% -l:8 -on:false -bri:145 -sat:1 -ct:443 
run %WHClocation% -l:9 -on:true -bri:251 -x:0.3696 -y:0.4402 -sat:254 
runwait %WHClocation% -l:10 -on:true -bri:254 -x:0.3135 -y:0.3293 -sat:254 
run %WHClocation% -l:11 -on:true -bri:251 -x:0.3504 -y:0.4019 -sat:253 
run %WHClocation% -l:12 -on:false -bri:254 
