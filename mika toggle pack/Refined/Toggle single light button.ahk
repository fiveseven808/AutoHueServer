#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

/*
6/18 notes
Combined the smart button toggle with the standard toggle. smart toggle is only for brian though 

*/


#include Add_INI.ahk
Main:
{
FileDelete, Lightstate_Amazon.state
If 0 > 0
	{
	lightnumber = %1%
	smart = %2%
	Goto Togglelight
	}
	else
	{
	Msgbox, Must be run in command line with switches `n`n"Toggle single light button.ahk" [Light ID] [S]
	ExitApp
	}
}
Return



Togglelight:
	HueCmd=%WHClocation% -lightstate:%lightnumber% > Lightstate_Amazon.state
	RunWait %comspec% /c """%HueCmd%""" ,,Hide
	FileReadLine,WHCResults,Lightstate_Amazon.state,1
	;msgbox %WHCResults%
	RegExMatch(WHCResults, "on"":(.*),""bri", l_on)  
	;msgbox, l_on1 = %l_on1%
	RegExMatch(WHCResults, "bri"":(.*),""ct", bri) 
	bri_len := StrLen(bri1)
	;msgbox %bri1%
	FileDelete, Lightstate_Amazon.state

If !smart
{
IfInString, l_on1, true	;only works with groups. individua lights have a "reachable thing: 
    {
	;msgbox, light is on
	HueCmd=%WHClocation% -l:%lightnumber% -on:false
	Run %comspec% /c """%HueCmd%""" ,,Hide
	}
IfInString, l_on1, false
    {
	;msgbox, light is off
	HueCmd=%WHClocation% -l:%lightnumber% -on:true -bri:254 -ct:346
	Run %comspec% /c """%HueCmd%""" ,,Hide
	}
}
else If smart
{
	IfInString, l_on1, true	;only works with groups. individua lights have a "reachable thing: 
		{
		;msgbox, light is on
		if bri1 < 253
			{
			;msgbox making brighter
			HueCmd=%WHClocation% -l:%lightnumber% -on:true -bri:254 -ct:346
			Run %comspec% /c """%HueCmd%""" ,,Hide
			}
		else
			{
			;msgbox turning off 
			HueCmd=%WHClocation% -l:%lightnumber% -on:false
			Run %comspec% /c """%HueCmd%""" ,,Hide
			}
		}
	IfInString, l_on1, false
		{
		;msgbox, light is off
		HueCmd=%WHClocation% -l:%lightnumber% -on:true -bri:254 -ct:346
		Run %comspec% /c """%HueCmd%""" ,,Hide
		}
}
	
