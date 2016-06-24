WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"

runwait %WHClocation% -l:1 -on:false -bri:254 
runwait %WHClocation% -l:2 -on:false -bri:154 
runwait %WHClocation% -l:5 -on:true -bri:254 -x:0.3789 -y:0.4586 -hue:28273 -sat:254 -ct:248 
runwait %WHClocation% -l:6 -on:false -bri:254 
runwait %WHClocation% -l:7 -on:true -bri:254 -ct:153 
runwait %WHClocation% -l:8 -on:true -bri:254 -ct:153 
