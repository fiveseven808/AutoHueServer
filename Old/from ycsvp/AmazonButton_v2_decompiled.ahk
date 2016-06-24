#SingleInstance Off
PingResults:="PingResults.txt"
PingErr1:="Destination host unreachable"
PingErr2:="Request Timed Out"
PingErr3:="TTL Expired in Transit"
PingErr4:="Unknown Host"
PingErr5:="Ping Request could not find host"
Clickcount = 0


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
	gosub CheckCompisbackoff
goto main


CheckCompison:
Loop
{
PingCmd:="ping " . ComputerName . " -n 1 >" . PingResults
RunWait %comspec% /c """%PingCmd%""",,Hide
Loop
	{
	PingError:=false
	FileReadLine,PingLine,%PingResults%,%A_Index%
	If (ErrorLevel=1 )
	Break
	IfInString,PingLine,%PingErr1%
		{
		PingError:=true
		break
		}
	IfInString,PingLine,%PingErr2%
		{
		PingError:=true
		break
		}
	IfInString,PingLine,%PingErr3%
		{
		PingError:=true
		break
		}
	IfInString,PingLine,%PingErr4%
		{
		PingError:=true
		break
		}
	IfInString,PingLine,%PingErr5%
		{
		PingError:=true
		break
		}
	}			
FileDelete,%PingResults%
If PingError != 1
	{
	break
	}
}
return

CheckCompisbackoff:
	Loop
	{
	sleep 2000
	PingCmd:="ping " . ComputerName . " -n 1 >" . PingResults
	RunWait %comspec% /c """%PingCmd%""",,Hide
	Loop
		{
		PingError:=false
		FileReadLine,PingLine,%PingResults%,%A_Index%
		If (ErrorLevel=1 )
		Break
		IfInString,PingLine,%PingErr1%
			{
			PingError:=true
			break
			}
		IfInString,PingLine,%PingErr2%
			{
			PingError:=true
			break
			}
		IfInString,PingLine,%PingErr3%
			{
			PingError:=true
			break
			}
		IfInString,PingLine,%PingErr4%
			{
			PingError:=true
			break
			}
		IfInString,PingLine,%PingErr5%
			{
			PingError:=true
			break
			}
		}
	FileDelete,%PingResults%
	If PingError != 0
		{
		break
		}
	}
Return
