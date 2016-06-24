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
FileAppend,%A_Now% Brian button Pressed!`n, %DaemonLog%
StringLen, numbah, sunset
;msgbox,sunset -10 = %sunset% numbah = %numbah% 
	If (ftime <= 600)														;If we come home before 6am
		{
		FileAppend,%A_Now% 600 `n, %DaemonLog%
		;run %WHClocation% -g:1 -on:true -bri:1					;Turn on Hallway light to 75%	
		run %WHClocation% -g:0 -on:false -bri:1					;Turn on Hallway light to 75%
		}	
	If (ftime >= 630 && ftime < 1200)														;If we come home before 6am
		{
		FileAppend,%A_Now% 630 1200 `n, %DaemonLog%
		runwait %WHClocation% -g:0 -on:true -bri:255					;Turn on everything to 100%	
		runwait %WHClocation% -sn:JXgWbuOznXkVYui						;Make bedroom nice and morning 
		runwait %WHClocation% -sn:H1lIT73NrbLmCLo						;Make Living room nice and morning
		}	
	If (ftime <= 1200 && ftime > 600)				;If we come home before noon but after 6am 
		{
		FileAppend,%A_Now% 1200 600`n, %DaemonLog%
		run %WHClocation% -l:5 -on:true -ct:155 -bri:254		 	;6pm Energize
		}
	If (ftime < 1830 && ftime > 1200)								;If we come home before 6pm
		{
		FileAppend,%A_Now% 1830 1200 `n, %DaemonLog%
		passingclouds = %A_ScriptDir%\scenesaver\Passing_Clouds\PassingcloudsL5n50.bat
		;msgbox %passingclouds%
		run %passingclouds%
		}
	If (ftime >= 1830 && ftime < sunset)											;If we come home after 6pm
		{
		FileAppend,%A_Now% 1830 sunset`n, %DaemonLog%
		;process, close, 
		;msgbox, it's after 1800 but before %sunset%
		run %WHClocation% -sn:y9fm4pv2umCmo79		 				;Turn on Group2: Main night 100% warm
		run %WHClocation% -g:4 -on:true -bri:191					;Turn on Hallway light to 75%	
		;run %WHClocation% -g:1 -on:true -bri:127					;Turn on Hallway light to 75%	
		}		
	else if (ftime > sunset && ftime < 2230)	;If we come home after 8 
		{
		FileAppend,%A_Now% sunset 2230`n, %DaemonLog%
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
		FileAppend,%A_Now% 2230`n, %DaemonLog%
		run %WHClocation% -g:0 -on:false -bri:1					;Turn off everything 	
		;what i would like to do instead is toggle between this and a brighter one
			/*
			run %WHClocation% -g:1 -on:true -bri:1				;Turn on bedroom lights to brightness 1
			*/
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