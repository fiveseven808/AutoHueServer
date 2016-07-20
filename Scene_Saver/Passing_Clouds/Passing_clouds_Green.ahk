#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

inilocation = %A_ScriptDir%\..\..\Config.ini
#include %A_ScriptDir%\..\..\Add_INI.ahk
;msgbox, %WHClocation%

ftime := a_hour . a_min													;Format time in a HHmm way 						
;msgbox wat = %ftime%


IfExist, C:\Program Files (x86)\WinHue 3\whc.exe
    WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"
IfExist, C:\Program Files\WinHue 3\whc.exe
    WHClocation = "C:\Program Files\WinHue 3\whc.exe"
lightorgroup = l:5

OnExit, ExitSub

Startup:
{
FileDelete, ..\..\StopAni.tsk
If 0 > 0
	{
	lightorgroup = %1%
	#include %A_ScriptDir%\..\..\sunrise_sunset_distilled.ahk								;Gives us %sunrise% and %sunset% variables
	sunset := sunset - 10	
	;msgbox, sunset = %sunset%
	FileAppend,%A_Now% starting passing clouds green. sun will set at %sunset%`n, ..\..\%DaemonLog%
	Goto Main
	}
	else
	{
	Msgbox, Must be run in command line with switches `n`n"Passing clouds.ahk" [l:(lightnumber) | g:(groupnumber)]
	ExitApp
	}
}
Return

Main:
{
	ftime := a_hour . a_min													;Format time in a HHmm way 	
	;msgbox, ftime %ftime% and sunset %sunset%
	if (ftime > sunset)
		{
		FileAppend,%A_Now% ftime %ftime% > sunset %sunset%`n, ..\..\%DaemonLog%
		ExitApp															;ExitApp after sundown. Don't run if the sun is up lol
		}
	IfExist, ..\..\StopAni.tsk
		ExitApp
	gosub Get_rand_num
	;runwait %WHClocation% -l:5 -on:true -bri:130 -colormode:ct -hue:34282 -sat:165 -ct:153 -tt:%rand%
	PingCmd:= WHClocation . " -" . lightorgroup . " -on:true -bri:254 -x:0.3789 -y:0.4586 -sat:254 -tt:" . rand
	;msgbox, %pingcmd%
	RunWait %comspec% /c """%PingCmd%""",,Hide
	sleep, %sleeptt%
	sleep, %sleeprand%
	sleepold = %sleeprand%
	rerandom:	
		gosub Get_rand_num
		if (sleeprand < sleepold)
			{
			;msgbox, sleeprand is too small! %sleeprand% < %sleepold%
			goto rerandom
			}			
		;runwait %WHClocation% -l:5 -on:true -bri:254 -colormode:ct -hue:34533 -sat:240 -ct:240 -tt:%rand%
		PingCmd:= WHClocation . " -" . lightorgroup . " -on:true -bri:127 -sat:165 -ct:153 -tt:" . rand
		RunWait %comspec% /c """%PingCmd%""",,Hide
		sleep, %sleeptt%
		sleep, %sleeprand%
goto main
}

Get_rand_num:
	Random, rand, 10, 100
	Random, sleeprand, 1000, 10000
	sleeptt := rand*100
return

ExitSub:
	FileAppend,%A_Now% exiting passing clouds green `n, ..\..\%DaemonLog%
	FileDelete, ..\..\StopAni.tsk
ExitApp 
