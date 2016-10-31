IfExist, C:\Program Files (x86)\WinHue 3\whc.exe
    WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"
IfExist, C:\Program Files\WinHue 3\whc.exe
    WHClocation = "C:\Program Files\WinHue 3\whc.exe"

;msgbox, a_hour is %a_hour%

;#include Wifi_Return_sch.ahk

;List of times and actions that will happen when the phone reconnects to Wifi
ftime := a_hour . a_min													;Format time in a HHmm way 
minotd:= a_hour * 60 + a_min											
;msgbox wat = %ftime%
#Include Add_INI.ahk
#include sunrise_sunset_distilled.ahk								;Gives us %sunrise% and %sunset% variables
sunset := sunset - 10												;Make the night mode turn on 10 min before actual sunset
FileAppend,%A_Now% On button Pressed!`n, %DaemonLog%
StringLen, numbah, sunset
eveningtime := sunset - 100
;msgbox,sunset -10 = %sunset% numbah = %numbah% 
	If (ftime <= 600)														;If we come home before 6am
		{
		FileAppend,%A_Now% 600 run brian but logic`n, %DaemonLog%
		;run %WHClocation% -g:1 -on:true -bri:1					;Turn on Hallway light to 75%	
		run brian_but_logic.ahk				
		}	
	If (ftime >= 600 && ftime < 800)														;If we come home before 6am
		{
		FileAppend,%A_Now% 630 800 `n, %DaemonLog%
		runwait %WHClocation% -g:0 -on:true -bri:255					;Turn on everything to 100%	
		runwait %WHClocation% -sn:JXgWbuOznXkVYui						;Make bedroom nice and morning 
		runwait %WHClocation% -sn:H1lIT73NrbLmCLo						;Make Living room nice and morning
		runwait %WHClocation% -g:5 -on:false 							;Turn off front porch light 
		}	
	If (ftime >= 800 && ftime < 1200)														;If we come home before 6am
		{
		FileAppend,%A_Now% 800 1200 `n, %DaemonLog%
		runwait %WHClocation% -g:0 -on:true -bri:255					;Turn on everything to 100%	
		runwait %WHClocation% -sn:JXgWbuOznXkVYui						;Make white morning 100 for master bedroom. long transition time 
		runwait %WHClocation% -sn:eLezqi1OE5HXXgs						;Make Living room energize
		}
	If (ftime <= 1200 && ftime > 1800)				;If we come home before noon but after 6am 
		{
		FileAppend,%A_Now% 1200 1800`n, %DaemonLog%
		run %WHClocation% -l:5 -on:true -ct:155 -bri:254		 	;6pm Energize
		}
	If (ftime < eveningtime && ftime > 1200)								;If we come home before 6pm
		{
		FileAppend,%A_Now% evening time and past noon but nothing is setup... `n, %DaemonLog%
		;passingclouds = %A_ScriptDir%\scenesaver\Passing_Clouds\PassingcloudsL5n50.bat
		;msgbox %passingclouds%
		;run %passingclouds%
		}
	If (ftime >= eveningtime && ftime < sunset)											;If we come home after 6pm
		{
		FileAppend,%A_Now% eveningtime but before sunset livin room main night 100 halway to 75`n, %DaemonLog%
		;process, close,  
		;msgbox, it's after 1800 but before %sunset%
		run %WHClocation% -sn:y9fm4pv2umCmo79		 				;Turn on Group2: Main night 100% warm
		run %WHClocation% -g:4 -on:true -bri:191					;Turn on Hallway light to 75%	
		;run %WHClocation% -g:1 -on:true -bri:127					;Turn on Hallway light to 75%	
		}		
	else if (ftime > sunset && ftime < 2130)	;If we come home after 8 
		{
		FileAppend,%A_Now% sunset 2130 living room mainnight 100 hallway to 75 bathroom to 1 and bedroom to 50 `n, %DaemonLog%
		;msgbox, it's after %sunset%
		run %WHClocation% -sn:rILZ32dtgZEFHDm						;Turn on Living Room (g2): Main Night 100% warm 
		run %WHClocation% -g:4 -on:true -bri:191					;Turn on Hallway light to 75%	
		run %WHClocation% -g:3 -on:true -bri:1						;Turn on Bathroom to 1%		
		run %WHClocation% -g:1 -on:true -bri:127					;Turn bedroom light to 50% 
		;what i would like to do instead is toggle between this and a brighter one
			/*
			run %WHClocation% -sn:rILZ32dtgZEFHDm						;Turn on Living Room (g2): Main Night 100% warm 
			run %WHClocation% -g:4 -on:true -bri:191					;Turn on Hallway light to 75%	
			run %WHClocation% -sn:Eaf10R5GyAgUoYO						;Turn on Bedroom Group 1: Reading Normal	
			*/
		}
	If (ftime >= 2130)														;If we come home before 6am
		{
		FileAppend,%A_Now% 2130 run brian but logic`n, %DaemonLog%
		run brian_but_logic.ahk
		}
;msgbox, meh
	
	

/*
Times when you would come home
Before you wake up
Before noon
After noon
Before you come home from work

15 min before sunset is a good time to switch, and or change settings
*/