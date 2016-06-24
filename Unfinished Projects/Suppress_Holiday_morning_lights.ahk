#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
WHClocation = "C:\Program Files\WinHue 3\whc.exe"

;Don't want bedroom lights to go on in the morning... Don't care what the schedule is...

msgbox, %a_hour% %a_min%
Main:
	Sleep 30000 ; Wait one minute
	if a_hour = 6
		{
		if a_min = 01
			{
			runwait %WHClocation% -g:0 -on:false
			}
		if a_min = 21
			{
			runwait %WHClocation% -g:0 -on:false
			}
		}	
return