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
PingCmd="C:\Program Files\WinHue 3\whc.exe" -lightstate:2 > Lightstate_Amazon.state
RunWait %comspec% /c """%PingCmd%""" ;,,Hide
FileReadLine,WHCResults,Lightstate_Amazon.state,1
FileDelete, Lightstate_Amazon.state

IfInString, whcresults, "on":true
    {
	;msgbox, lights are on %whcresults%
	lightson = 1
	Nightmode = 0
	IfInString, whcresults, "bri":2`,
		{
		;msgbox, lights are nightmode
		Nightmode = 1
		;PingCmd="C:\Program Files (x86)\WinHue 3\whc.exe" -g:0 -on:false -bri:1
		;RunWait %comspec% /c """%PingCmd%""" ;,,Hide
		runwait, "C:\Program Files\WinHue 3\whc.exe" -g:1 -on:false
		runwait, "C:\Program Files\WinHue 3\whc.exe" -g:2 -on:true -bri:1 -ct:1
		runwait, "C:\Program Files\WinHue 3\whc.exe" -g:3 -on:false -bri:1
		}
	else
		runwait, "C:\Program Files\WinHue 3\whc.exe" -g:1 -on:false
	}
IfInString, whcresults, false
    {
	;msgbox, lights are off
	lightson = 0
	if nightmode = 1
		{
		PingCmd="C:\Program Files\WinHue 3\whc.exe" -g:1 -on:true -bri:1
		RunWait %comspec% /c """%PingCmd%""" ;,,Hide
		}
	else
		{
		PingCmd="C:\Program Files\WinHue 3\whc.exe" -g:1 -on:true -bri:254
		RunWait %comspec% /c """%PingCmd%""" ;,,Hide
		}
	}

	
	
