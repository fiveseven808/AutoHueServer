#SingleInstance Off
PingResults:="PingResults.txt"
PingYas:="bytes=32"

/*
Changelog: 
2016/6/9
	- reduced memory footprint
	- changed detection algorithm from 5 or so checks to 1 check per iteration. 
	- reduced cpu load
	- optimized off-checking. (so you can use the button again faster)
	- added tooltips for status on amazon button so you know what it's doing
*/
Main:
{
FileDelete,%PingResults%
If 0 > 0
	{
	Computername = %1%
	Goto Checkcomp
		}
		else
		{
	Msgbox, Must be run in command line with switches `n`nAmazonButton_v2 [Button IP] [Program to Launch]
	ExitApp
	}
}
Return

Checkcomp:
	gosub CheckCompison
	run %2%
	ToolTip, Button at %1%`nhas been pushed.
	SetTimer, RemoveToolTip, 2000
	gosub CheckCompisbackoff
goto Checkcomp


CheckCompison:
Loop
{
PingCmd:="ping " . ComputerName . " -n 2 >" . PingResults
RunWait %comspec% /c """%PingCmd%""",,Hide
Loop
	{
	PingError:=false
	FileReadLine,PingLine,%PingResults%,%A_Index%
	If (ErrorLevel=1 )
	Break
	IfInString,PingLine,%PingYas%
		{
		PingError:=true
		break
		}
	}			
;FileDelete,%PingResults%
If PingError = 1
	{
	break
	}
}
return

CheckCompisbackoff:
	Loop
	{
	sleep 1000
	PingCmd:="ping " . ComputerName . " -n 1 >" . PingResults
	RunWait %comspec% /c """%PingCmd%""",,Hide
	Loop
		{
		PingError:=false
		FileReadLine,PingLine,%PingResults%,%A_Index%
		If (ErrorLevel=1 )
		Break
		IfInString,PingLine,%PingYas%
			{
			PingError:=true
			break
			}
		}
	;msgbox, broke out of loop
	;FileDelete,%PingResults%
	If PingError = 0
		{
		;msgbox, button disappeared!
		ToolTip, Button at %1%`nhas disappeared.
		SetTimer, RemoveToolTip, 2000
		break
		}
	}
Return

RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return
