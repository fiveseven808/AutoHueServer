#SingleInstance Off
PingResults:="PingResults.txt"
PingErr1:="Destination host unreachable"
PingErr2:="Request Timed Out"
PingErr3:="TTL Expired in Transit"
PingErr4:="Unknown Host"
PingErr5:="Ping Request could not find host"
PingYas:="bytes=32"
Clickcount = 0
bothcompsoff = 0
Home_L_WIFI_State = 1	

/*
Notes:
1st, ping the phone like 3x. 
If any of the pings come back, then obviously the phone is home. 
If the phone doesnt come back, then maybe the phone is disconnected, run the action
Wait 5-10 minutes (or 5 seconds to test)
Goto 1st. 


*/

Main:
{
FileDelete,%PingResults%
If 0 > 0
	{
	Computername = %1%
	Computername2 = %2%
	Goto Checkcomp
		}
		else
		{
	Msgbox, Must be run in command line with switches `n`nAmazonButton_v2 [Phone1 IP] [Phone2 IP] [Program when leaving House] [Program when coming back] `n`n`This launches a program when your phone goes out of wifi range. i.e. shut off the lights.
	ExitApp
	}
}
Return

Checkcomp:
	bothcompsoff = 0	
	Computername = %1%		;Reset phone on checking
	gosub CheckCompison					;Checking if 1st phone is home
	gosub CheckCompisbackoff			;Checking if 1st phone is really off
	Computername = %2%					;Switching to 2nd phone
	gosub CheckCompison					;Checking to see if 2nd phone is home
	gosub CheckCompisbackoff			;Checking to see if 2nd phone is really off
	if (bothcompsoff=2)					;If both phones are away from home
		{
		run %3%							;Turn off the house lights
		Home_L_WIFI_State = 0			;Let the program know that wifi is keeping the lights off. 
		}
	If Home_L_WIFI_State = 0			;If the lights were turned off by wifi
		goto Checkcomp					;Start the process again ASAP
	sleep 60000 						;If the process wasn't then check every 5 minutes 
goto Checkcomp


CheckCompison:
Loop
{
PingCmd:="ping " . ComputerName . " -n 3 >" . PingResults
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
		;msgbox, found the phone at %computername%! 
		if bothcompsoff > 0
			bothcompsoff := bothcompsoff - 1
		gosub CameBackHome
		If Home_L_WIFI_State = 1			;If the lights were not turned off by wifi
			sleep 100000					;Start the process again after 10 minutes. dont wanna kill phone with pings 
		break
		}
	}			
FileDelete,%PingResults%
If PingError != 1
	{
	break
	}
;sleep 5000
}
return

CheckCompisbackoff:
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
		IfInString,PingLine,%PingYas%
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
		bothcompsoff := bothcompsoff + 1
		;msgbox, lost the phone the phone! bothcompsoff = %bothcompsoff%
		break
		}
	}
Return

CameBackHome:
;Looks like the phone is back on, check if homestate is off, if it's off then obviously 
If Home_L_WIFI_State = 0
	{
	;msgbox, phone came back home!!!
	Home_L_WIFI_State = 1
	;If a_hour > 18
	;	run %4%	
	;If a_hour < 6
		run %4%	
	}

Return
