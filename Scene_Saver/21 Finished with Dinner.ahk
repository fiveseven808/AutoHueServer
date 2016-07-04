IfExist, C:\Program Files (x86)\WinHue 3\whc.exe
	WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"
IfExist, C:\Program Files\WinHue 3\whc.exe
	WHClocation = "C:\Program Files\WinHue 3\whc.exe"

runwait %WHClocation% -l:1 -on:true -bri:1 
runwait %WHClocation% -l:2 -on:true -bri:144 
runwait %WHClocation% -l:5 -on:true -bri:144 -x:0.5015 -y:0.4153 -sat:200 
runwait %WHClocation% -l:6 -on:true -bri:254 
runwait %WHClocation% -l:7 -on:true -bri:127 -sat:1 -ct:450 
runwait %WHClocation% -l:8 -on:true -bri:127 -sat:1 -ct:450 
runwait %WHClocation% -l:9 -on:true -bri:144 -sat:197 -ct:435 
runwait %WHClocation% -l:10 -on:true -bri:144 -sat:197 -ct:439 
runwait %WHClocation% -l:11 -on:true -bri:129 -sat:197 -ct:435 
runwait %WHClocation% -l:12 -on:false -bri:254 
