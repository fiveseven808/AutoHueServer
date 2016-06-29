;List of times and actions that will happen when the phone reconnects to Wifi
inilocation = Config.ini
#include Add_INI.ahk

ftime := a_hour . a_min													;Format time in a HHmm way 
minotd:= a_hour * 60 + a_min											
;msgbox wat = %ftime%
#include sunrise_sunset_distilled.ahk								;Gives us %sunrise% and %sunset% variables
sunset := sunset - 10												;Make the night mode turn on 10 min before actual sunset
;WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"
;WHClocation = "C:\Program Files\WinHue 3\whc.exe"
;msgbox, whclocation = %whclocation%
IfExist, C:\Program Files (x86)\WinHue 3\whc.exe
    WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"
IfExist, C:\Program Files\WinHue 3\whc.exe
    WHClocation = "C:\Program Files\WinHue 3\whc.exe"

StringLen, numbah, sunset
	If (ftime <= 600)														;If we come home before 6am
		{
		FileAppend,%A_Now% ftime <= 600 `n, %DaemonLog%
		run %WHClocation% -sn:rILZ32dtgZEFHDm						;Turn on Living Room (g2): Main Night 100% warm 
		run %WHClocation% -g:4 -on:true -bri:191					;Turn on Hallway light to 75%	
		run %WHClocation% -sn:Eaf10R5GyAgUoYO						;Turn on Group 1: Reading Normal
		run %WHClocation% -g:3 -on:true -bri:1						;Turn on Bathroom to 1%		
		}	
	If (ftime <= 1200 && ftime > 600)								;If we come home before noon but after 6am 
		{
		FileAppend,%A_Now% ftime <= 1200 && ftime > 600 `n, %DaemonLog%
		run %WHClocation% -l:5 -on:true -ct:155 -bri:254		 	;6pm Energize
		}
	If (ftime < 1830 && ftime > 1200)								;If we come home before 6pm
		{
		FileAppend,%A_Now% ftime < 1830 && ftime > 1200 `n, %DaemonLog%
		;msgbox wat = %ftime%											
		;run %WHClocation% -l:5 -on:true -ct:220	-bri:188	 		;6pm Concentrate
		;sleep 600000													;Wait about 10 minutes, then bring it to green
		/*run %WHClocation% -sn:1WHGpel2QbjsaUD						;Turn green
		tempmath := a_hour - 12
		tempmath := tempmath / 
		tempmath := 1-tempmath
		tempmath := (tempmath * 127) + 127
		StringLeft, tempmath, tempmath, 3
		run %WHClocation% -l:5 -on:true -bri:%tempmath%				;The closer it gets to 5pm, the closer the light gets to 50% brightness from 100% 
		*/
		;passingclouds = %A_ScriptDir%\Scene_Saver\Passing_Clouds\Passing_clouds_with_L5green.bat Passing_clouds_Green.ahk l:5
		passingclouds = %A_ScriptDir%\Scene_Saver\Passing_Clouds\Passing_clouds_Green.ahk l:5
		;msgbox %passingclouds%
		run %passingclouds%
		fileappend, omg
		}
	If (ftime >= 1830 && ftime < sunset)											;If we come home after 6pm
		{
		FileAppend,%A_Now% ftime >= 1830 && ftime < sunset `n, %DaemonLog%
		;msgbox, it's after 1800 but before %sunset%
		run %WHClocation% -sn:y9fm4pv2umCmo79		 				;Turn on Group2: Main night 100% warm
		run %WHClocation% -g:4 -on:true -bri:191					;Turn on Hallway light to 75%	
		}		
	else if (ftime > sunset)															;If we come home after 8 
		{
		FileAppend,%A_Now% else ftime > sunset`n, %DaemonLog%
		;msgbox, it's after %sunset%
		;run %WHClocation% -sn:rILZ32dtgZEFHDm						;Turn on Living Room (g2): Main Night 100% warm 
		;run %WHClocation% -g:4 -on:true -bri:191					;Turn on Hallway light to 75%	
		;run %WHClocation% -sn:Eaf10R5GyAgUoYO						;Turn on Group 1: Reading Normal
		;run %WHClocation% -g:3 -on:true -bri:1						;Turn on Bathroom to 1%		
		run %A_ScriptDir%\Scene_Saver\ComingHomeAfterSunset.ahk
		;run %A_ScriptDir%\Scene_Saver\bleh.txt
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