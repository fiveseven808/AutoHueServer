#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


/*
How it works?

Check to see the current light state
if the light state is off
	thrn on the lights to 0
if light on and bri state is 1
	turn lights off
if light on and bri state is 0
	turn lights off
	
*/
Nightmode = 1

;runwait, "C:\Program Files (x86)\WinHue 3\whc.exe" -groupstate:1 >> Lightstate_Amazon.state

FileDelete, Lightstate_Amazon.state
HueCmd="C:\Program Files (x86)\WinHue 3\whc.exe" -groupstate:1 > Lightstate_Amazon.state
RunWait %comspec% /c """%HueCmd%""" ;,,Hide
FileReadLine,WHCResults,Lightstate_Amazon.state,1
FileDelete, Lightstate_Amazon.state

IfInString, whcresults, true	;only works with groups. individua lights have a "reachable thing: 
    {
	;msgbox, lights are on
	lightson = 1
	Nightmode = 0
	IfInString, whcresults, "bri":1`,
		{
		msgbox, lights are nightmode
		Nightmode = 1
		PingCmd="C:\Program Files (x86)\WinHue 3\whc.exe" -g:0 -on:false -bri:1
		RunWait %comspec% /c """%PingCmd%""" ;,,Hide
		}
	else
		{
		msgbox, bri is different than 1
		}
	}
IfInString, whcresults, false
    {
	;msgbox, lights are off
	lightson = 0
	if nightmode = 1
		{
		PingCmd="C:\Program Files (x86)\WinHue 3\whc.exe" -g:1 -on:true -bri:1
		RunWait %comspec% /c """%PingCmd%""" ;,,Hide
		}
	else
		{
		PingCmd="C:\Program Files (x86)\WinHue 3\whc.exe" -g:1 -on:true -bri:254
		RunWait %comspec% /c """%PingCmd%""" ;,,Hide
		}
	}

	
	
