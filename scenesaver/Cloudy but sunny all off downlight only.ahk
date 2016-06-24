WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"

runwait %WHClocation% -l:1 -on:false -bri:254 
runwait %WHClocation% -l:2 -on:false -bri:154 
runwait %WHClocation% -l:5 -on:true -bri:254 -hue:27837 -sat:199
runwait %WHClocation% -l:6 -on:false -bri:254 
runwait %WHClocation% -l:7 -on:false -bri:254 -sat:1 -ct:153 
runwait %WHClocation% -l:8 -on:false -bri:254 -sat:1 -ct:153 
