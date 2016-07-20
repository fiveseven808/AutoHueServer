#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

IfExist, C:\Program Files (x86)\WinHue 3\whc.exe
    WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"
IfExist, C:\Program Files\WinHue 3\whc.exe
    WHClocation = "C:\Program Files\WinHue 3\whc.exe"


HueCmd=%WHClocation% -lightstate:8 > Lightstate_Amazon.state
RunWait %comspec% /c """%HueCmd%""" ,,Hide
FileReadLine,WHCResults,Lightstate_Amazon.state,1
;msgbox %WHCResults%
RegExMatch(WHCResults, "on"":(.*),""bri", l_on)  
;msgbox, l_on1 = %l_on1%
RegExMatch(WHCResults, "bri"":(.*),""ct", bri) 
bri_len := StrLen(bri1)
;msgbox %bri1%
FileDelete, Lightstate_Amazon.state
IfInString, l_on1, true	;only works with groups. individua lights have a "reachable thing: 
	{
	run %WHClocation% -g:0 -on:false -bri:1		;turn everything off if any light is on 
	}
IfInString, l_on1, false						;turn a few things on if night time and everything is off
	{
	run %WHClocation% -l:1 -on:false -bri:1 
	run %WHClocation% -l:2 -on:false -bri:1 
	runwait %WHClocation% -l:5 -on:true -bri:1 -sat:195 -ct:435 -tt:10
	run %WHClocation% -l:6 -on:true -bri:1 -tt:10
	run %WHClocation% -l:7 -on:false -bri:1 -sat:1 -ct:381 
	run %WHClocation% -l:8 -on:true -bri:1 -sat:1 -ct:381 -tt:10
	run %WHClocation% -l:9 -on:false -bri:1 -sat:193 -ct:432 
	runwait %WHClocation% -l:10 -on:false -bri:1 -sat:193 -ct:432 
	run %WHClocation% -l:11 -on:true -bri:1 -sat:195 -ct:435 -tt:10
	run %WHClocation% -l:12 -on:false -bri:254 
	}