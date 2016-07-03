IfExist, C:\Program Files (x86)\WinHue 3\whc.exe
	WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"
IfExist, C:\Program Files\WinHue 3\whc.exe
	WHClocation = "C:\Program Files\WinHue 3\whc.exe"

runwait %WHClocation% -l:1 -on:true -bri:191 
runwait %WHClocation% -l:2 -on:true -bri:254 
runwait %WHClocation% -l:5 -on:true -bri:254 -x:0.3642 -y:0.3689 -sat:72 
runwait %WHClocation% -l:6 -on:false -bri:1 
runwait %WHClocation% -l:7 -on:false -bri:254 -sat:1 -ct:255 
runwait %WHClocation% -l:8 -on:false -bri:254 -sat:1 -ct:228 
runwait %WHClocation% -l:9 -on:true -bri:254 -x:0.3962 -y:0.3875 -sat:35 
runwait %WHClocation% -l:10 -on:true -bri:254 -x:0.3962 -y:0.3875 -sat:35 
runwait %WHClocation% -l:11 -on:true -bri:254 -x:0.3962 -y:0.3875 -sat:35 
runwait %WHClocation% -l:12 -on:false -bri:254 
