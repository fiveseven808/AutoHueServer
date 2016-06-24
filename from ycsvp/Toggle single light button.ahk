#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Main:
{
FileDelete, Lightstate_Amazon.state
If 0 > 0
	{
	lightnumber = %1%
	Goto Togglelight
	}
	else
	{
	Msgbox, Must be run in command line with switches `n`n"Toggle single light button.ahk" [Light ID]
	ExitApp
	}
}
Return



Togglelight:
	HueCmd="C:\Program Files (x86)\WinHue 3\whc.exe" -lightstate:%lightnumber% > Lightstate_Amazon.state
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
	;msgbox, light is on
	HueCmd="C:\Program Files (x86)\WinHue 3\whc.exe" -l:7 -on:false
	Run %comspec% /c """%HueCmd%""" ,,Hide
	}
IfInString, l_on1, false
    {
	;msgbox, light is off
	HueCmd="C:\Program Files (x86)\WinHue 3\whc.exe" -l:7 -on:true -bri:254 -ct:346
	Run %comspec% /c """%HueCmd%""" ,,Hide
	}

	
	
