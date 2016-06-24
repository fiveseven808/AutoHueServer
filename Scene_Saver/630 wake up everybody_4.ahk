WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"

runwait %WHClocation% -l:1 -on:true -bri:254 
runwait %WHClocation% -l:2 -on:true -bri:254 
runwait %WHClocation% -l:5 -on:true -bri:254 -hue:33897 -sat:61 -ct:226 
runwait %WHClocation% -l:6 -on:false -bri:254 
runwait %WHClocation% -l:7 -on:true -bri:254 -ct:255 
runwait %WHClocation% -l:8 -on:true -bri:254 -ct:228 
