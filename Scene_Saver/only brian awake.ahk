IfExist, C:\Program Files (x86)\WinHue 3\whc.exe
	WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"
IfExist, C:\Program Files\WinHue 3\whc.exe
	WHClocation = "C:\Program Files\WinHue 3\whc.exe"

;msgbox, a_hour is %a_hour%

;#include Wifi_Return_sch.ahk
;Mika is sleeping without brian:
		runwait %WHClocation% -l:7 -on:false 							;Turn off Mika's light
		runwait %WHClocation% -l:2 -on:false							;Turn off table lamp
		runwait %WHClocation% -l:8 -on:true -bri:64 -ct:342 			;Dim brian's light 
		runwait %WHClocation% -g:2 -on:true -bri:64						;Turn downlight to 25% 
		runwait %WHClocation% -g:4 -on:true -bri:128					;Turn on Hallway light to 75%	
		runwait %WHClocation% -g:3 -on:true -bri:1						;Turn on Bathroom to 1%		

