#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

IfExist, C:\Program Files (x86)\WinHue 3\whc.exe
    WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"
IfExist, C:\Program Files\WinHue 3\whc.exe
    WHClocation = "C:\Program Files\WinHue 3\whc.exe"

tempLSfile = LS_temp.txt
Scenefile = Scene.ahk
Max_light_ID = 5

FileDelete, %Scenefile%

;how many lights in the house?
;run whc -ll. on the last line see what [ID]= and get that number

Main: 
;FileAppend, WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"`n`n ,%Scenefile%
FileAppend,  ; The comma is required in this case.
	(
	IfExist, C:\Program Files (x86)\WinHue 3\whc.exe
	WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"
IfExist, C:\Program Files\WinHue 3\whc.exe
	WHClocation = "C:\Program Files\WinHue 3\whc.exe"
		
		
	), %Scenefile%
 Loop
		{
		if A_index > %Max_light_ID%
			Break
		PingCmd:= WHClocation . " -groupstate:" . A_index . " > " . tempLSfile
		RunWait %comspec% /c """%PingCmd%""",,Hide
		PingError:=false
		FileReadLine,Light_state_Line,%tempLSfile%,1
		;msgbox, %Light_state_Line%
		gosub Pick_out_values
		if C_mode1
			{
				;msgbox, SOMETHING FOUND! light at %a_index% is %C_mode1%
				if C_mode1 = "ct"
					{
					;msgbox, light at %a_index% is 
					FileAppend, runwait `%WHClocation`% -g:%a_index% -on:%l_on1% -bri:%bri1% -sat:%sat1% -ct:%ct1% `n ,%Scenefile%
					}					
				if C_mode1 = "xy"
					{
					RegExMatch(xy1,"\[(.*)\,", x_cord)
					RegExMatch(xy1,"\,(.*)\]", y_cord)
					;msgbox, x= %x_cord1% and y = %y_cord1%
					FileAppend, runwait `%WHClocation`% -g:%a_index% -on:%l_on1% -bri:%bri1% -x:%x_cord1% -y:%y_cord1% -sat:%sat1% `n ,%Scenefile%
					}
				if C_mode1 = "hs"
					{
					;msgbox, light at %a_index% is XY
					FileAppend, runwait `%WHClocation`% -g:%a_index% -on:%l_on1% -bri:%bri1% -hue:%hue1% -sat:%sat1%`n ,%Scenefile%
					}
			}
		else if hue1 > 1
			{
			;msgbox, hue1 = %hue1%
			FileAppend, runwait `%WHClocation`% -g:%a_index% -on:%l_on1% -bri:%bri1% -hue:%hue1% -sat:%sat1% -ct:%ct1% `n ,%Scenefile%
			}
		else if ct1 > 1
			{
			;msgbox, c1 = %ct1%
			FileAppend, runwait `%WHClocation`% -g:%a_index% -on:%l_on1% -bri:%bri1% -ct:%ct1% `n ,%Scenefile%
			}
		else if bri1 >= 1
			{
			;msgbox, else
			FileAppend, runwait `%WHClocation`% -g:%a_index% -on:%l_on1% -bri:%bri1% `n ,%Scenefile%
			}
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
if hue1 < 1
	hue1 = 1
RegExMatch(Light_state_Line, "sat"":(.*),""xy", sat)  
;msgbox, sat1 = %sat1%
if sat1 < 1
	sat1 = 1
RegExMatch(Light_state_Line, "xy"":(.*),""ct", xy)  
;msgbox, xy1 = %xy1%
RegExMatch(Light_state_Line, "ct"":(.*),""ef", ct)  ; need to prune off the quotes
ct_len := StrLen(ct1)
if ct_len != 3
	{
	;msgbox, wtf, ct length is %ct_len% long! 
	RegExMatch(Light_state_Line, "ct"":(.*),""co", ct)
	ct_len := StrLen(ct1)
	;msgbox, ctlen = %ct_len% and ct1 = %ct1%
	}
if ct1 < 1
	ct1 = 1
;msgbox, ct1 = %ct1%
RegExMatch(Light_state_Line, "colormode"":(.*),""al", C_mode)  
;msgbox, C_mode1 = %C_mode1%
;if C_mode1 < 1
;	C_mode1 = ct
}
return