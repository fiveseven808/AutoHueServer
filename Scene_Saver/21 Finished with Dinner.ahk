IfExist, C:\Program Files (x86)\WinHue 3\whc.exe
	WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"
IfExist, C:\Program Files\WinHue 3\whc.exe
	WHClocation = "C:\Program Files\WinHue 3\whc.exe"

run %WHClocation% -g:1 -on:true -bri:127 -sat:1 -ct:450 -tt:100
run %WHClocation% -g:2 -on:true -bri:129 -sat:193 -ct:432 -tt:100
run %WHClocation% -g:3 -on:true -bri:254 -tt:100
run %WHClocation% -g:4 -on:true -bri:1 -tt:100
run %WHClocation% -g:5 -on:false -bri:254 -tt:100
