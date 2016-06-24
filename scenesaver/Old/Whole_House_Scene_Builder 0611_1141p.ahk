#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"
tempLSfile = LS_temp.txt
Scenefile = Scene.ahk
Max_light_ID = 8

FileDelete, %Scenefile%

;how many lights in the house?
;run whc -ll. on the last line see what [ID]= and get that number

Main: 
 Loop
		{
		if A_index > %Max_light_ID%
			Break
		PingCmd:= WHClocation . " -lightstate:" . A_index . " > " . tempLSfile
		RunWait %comspec% /c """%PingCmd%""",,Hide
		PingError:=false
		FileReadLine,Light_state_Line,%tempLSfile%,1
		gosub Pick_out_values
		FileAppend, runwait %WHClocation% -l:%a_index% -on:%l_on1% -bri:%bri1% -colormode:%C_mode1% -hue:%hue1% -sat:%sat1% -ct:%ct1% `n ,%Scenefile%
		}
	FileDelete, %tempLSfile%
 	msgbox, finished
exitapp

Pick_out_values:
{
RegExMatch(Light_state_Line, "on"":(.*),""bri", l_on)  
;msgbox, l_on1 = %l_on1%
RegExMatch(Light_state_Line, "bri"":(.*),""al", bri)  ; dependnt on pulling form 
bri_len := StrLen(bri1)
if bri_len > 3
	{
	;msgbox, wtf, bri length is %bri_len% long! 
	RegExMatch(Light_state_Line, "bri"":(.*),""hu", bri) 
	bri_len := StrLen(bri1)
	;msgbox, brilen = %bri_len% and bri1 = %bri1%
	if bri_len < 1
		{
		;msgbox, wtf, bri length is STILL %bri_len% long! 
		RegExMatch(Light_state_Line, "bri"":(.*),""ct", bri) 
		bri_len := StrLen(bri1)
		;msgbox, brilen = %bri_len% and bri1 = %bri1%
		}
	}
;msgbox, bri1 = %bri1%
RegExMatch(Light_state_Line, "hue"":(.*),""sa", hue)  
;msgbox, hue1 = %hue1%
RegExMatch(Light_state_Line, "sat"":(.*),""xy", sat)  
;msgbox, sat1 = %sat1%
RegExMatch(Light_state_Line, "ct"":(.*),""ef", ct)  ; need to prune off the quotes
ct_len := StrLen(ct1)
if ct_len != 3
	{
	;msgbox, wtf, ct length is %ct_len% long! 
	RegExMatch(Light_state_Line, "ct"":(.*),""co", ct)
	ct_len := StrLen(ct1)
	;msgbox, ctlen = %ct_len% and ct1 = %ct1%
	}
;msgbox, ct1 = %ct1%
RegExMatch(Light_state_Line, "colormode"":(.*),""al", C_mode)  
;msgbox, C_mode1 = %C_mode1%
}
return