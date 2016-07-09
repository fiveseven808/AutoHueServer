IfExist, C:\Program Files (x86)\WinHue 3\whc.exe
	WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"
IfExist, C:\Program Files\WinHue 3\whc.exe
	WHClocation = "C:\Program Files\WinHue 3\whc.exe"

run %WHClocation% -l:1 -on:true -bri:2 
run %WHClocation% -l:2 -on:false -bri:145 
runwait %WHClocation% -l:5 -on:true -bri:3 -x:0.492 -y:0.4192 -sat:195 
run %WHClocation% -l:6 -on:true -bri:1 
run %WHClocation% -l:7 -on:false -bri:1 -sat:1 -ct:381 
run %WHClocation% -l:8 -on:true -bri:2 -sat:1 -ct:342 
run %WHClocation% -l:9 -on:false -bri:144 -x:0.4991 -y:0.4152 -sat:197 
runwait %WHClocation% -l:10 -on:false -bri:144 -x:0.4991 -y:0.4152 -sat:197 
run %WHClocation% -l:11 -on:false -bri:144 -x:0.4991 -y:0.4152 -sat:197 
run %WHClocation% -l:12 -on:false -bri:254 
