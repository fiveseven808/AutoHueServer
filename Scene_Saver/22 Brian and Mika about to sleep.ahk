IfExist, C:\Program Files (x86)\WinHue 3\whc.exe
	WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"
IfExist, C:\Program Files\WinHue 3\whc.exe
	WHClocation = "C:\Program Files\WinHue 3\whc.exe"

run %WHClocation% -l:1 -on:true -bri:1 -tt 100
run %WHClocation% -l:2 -on:false -bri:144 -tt 100
run %WHClocation% -l:5 -on:true -bri:144 -x:0.5015 -y:0.4153 -sat:200 -tt 100
run %WHClocation% -l:6 -on:true -bri:1 -tt 100
runwait %WHClocation% -l:7 -on:true -bri:127 -sat:1 -ct:450 -tt 100
run %WHClocation% -l:8 -on:true -bri:127 -sat:1 -ct:450 -tt 100
run %WHClocation% -l:9 -on:false -bri:144 -sat:199 -ct:443 -tt 100
run %WHClocation% -l:10 -on:false -bri:144 -sat:199 -ct:443 -tt 100
runwait %WHClocation% -l:11 -on:true -bri:1 -sat:199 -ct:443 -tt 100
