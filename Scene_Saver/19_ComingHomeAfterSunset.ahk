IfExist, C:\Program Files (x86)\WinHue 3\whc.exe
	WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"
IfExist, C:\Program Files\WinHue 3\whc.exe
	WHClocation = "C:\Program Files\WinHue 3\whc.exe"

runwait %WHClocation% -g:1 -on:true -bri:254 -sat:1 -ct:343 
runwait %WHClocation% -g:2 -on:true -bri:254 -x:0.4423 -y:0.4059 -sat:117 
runwait %WHClocation% -g:3 -on:true -bri:1 
runwait %WHClocation% -g:4 -on:true -bri:191 
runwait %WHClocation% -g:5 -on:true -bri:254 
