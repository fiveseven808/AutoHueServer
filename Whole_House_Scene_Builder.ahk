#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"
tempLSfile = LS_temp.txt
Scenefile = Scene.scn

;msgbox, a_hour is %a_hour%
FileDelete, %Scenefile%

/*
;#include Wifi_Return_sch.ahk
;Mika is sleeping without brian:
		runwait %WHClocation% -l:7 -on:false 							;Turn off Mika's light
		runwait %WHClocation% -l:2 -on:false							;Turn off table lamp
		runwait %WHClocation% -l:8 -on:true -bri:64 -ct:342 			;Dim brian's light 
		runwait %WHClocation% -g:2 -on:true -bri:64						;Turn downlight to 25% 
		runwait %WHClocation% -g:4 -on:true -bri:128					;Turn on Hallway light to 75%	
		runwait %WHClocation% -g:3 -on:true -bri:1						;Turn on Bathroom to 1%		

;how many lights in the house?
run whc -ll. on the last line see what [ID]= and get that number
*/ 
runwait %WHClocation% -lightstate:1 >> output.txt
; run whc -lightstate:%a_index% > %tempLSfile%
 ;retrieve -on: -bri: -colormode:C_mode -%C_mode%: -hue: -sat: -ct: 
 ;FileAppend, runwait %WHClocation% -l:%a_index%-on:%l_on% -bri:%bri% -colormode:%C_mode% -hue:%hue% -sat:%sat% -ct:%ct%  ,%Scenefile%
 
 Loop
		{
		PingError:=false
		FileReadLine,Light_state_Line,%tempLSfile%,%A_Index%
		If (ErrorLevel=1 )
		Break
		;FoundPos := RegExMatch("abcXYZ123", "abc(.*)123", SubPat)  ; Returns 1 and stores "XYZ" in SubPat1.
		RegExMatch(Light_state_Line, """on"":(.*)`,""", l_on)  ; Returns 1 and stores "XYZ" in SubPat1.
		msgbox, l_on = %l_on%
		}
msgbox, finished