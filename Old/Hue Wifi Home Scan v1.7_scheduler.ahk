#SingleInstance Off
PingResults:="HWHS17_PingResults.txt"
PingErr1:="Destination host unreachable"
PingErr2:="Request Timed Out"
PingErr3:="TTL Expired in Transit"
PingErr4:="Unknown Host"
PingErr5:="Ping Request could not find host"
PingYas:="bytes=32"
Clickcount = 0
bothcompsoff = 0
Home_L_WIFI_State = 1			;Master state of all the lights int he house. i.e. if it's 0, don't let any lights power on. If it's 1 then lights are free to do whatever 

#Include Add_INI.ahk			;Pull in other variables. 

;WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"
WHClocation = "C:\Program Files\WinHue 3\whc.exe"

/*
v1.5 Operation of the program

Check phone 1
Check phone 2
If either of these phones are on the network, 
	it brings the lights on 
	depending on the time 
	and pauses in that loop for 5 minutes. 
	Checking very often may lead to reduced phone battery life while at home
	also 
Keep checking phone 1 and 2 until you hit 4 times in succession no phone detected. 

Once you hit 4 seqential times a phone is not detected, break out of loop
If the lights were last on then write to a log filehen
Then turn the lights off
Sleep for 30 seconds so you don't eat up all the tablets resources

Start again
*/

Main:
{
FileDelete,%PingResults%
If 0 > 0
	{
	Computername = %1%
	Computername2 = %2%
	FileAppend,------------------------------------------------------------------------------------------`n, %DaemonLog%
	FileAppend,%A_Now% Now starting %A_ScriptName%! `nRunning on %A_ComputerName% from path %WHClocation%`n, %DaemonLog%
	Goto Checkcomp
	}
else
	{
	Msgbox, Must be run in command line with switches `n`n"Hue Wifi Home Scan v1.4.ahk" [Phone1 IP] [Phone2 IP] [Program when leaving House] [Program when coming back] `n`n`This launches a program when your phones go in and out of wifi range. `ni.e. shut off the lights when no one is home. Turn the lights back on when someone comes back home. 
	ExitApp
	}
}
Return

Checkcomp:
	bothcompsoff = 0	
	;msgbox, starting loop
	loop
		{
		Computername = %1%					;Switching to 1st phone
		gosub CheckCompison					;Checking if 1st phone is home
		Computername = %2%					;Switching to 2nd phone
		gosub CheckCompison					;Checking to see if 2nd phone is home
		;msgbox, bothcompsoff = %bothcompsoff%
		If bothcompsoff = 4					;Break out of this ONLY when a phone hasn't been seen 4x i.e. it's still looping if it sees a phone
			break									
		}
	;FileAppend,%A_Now% broke out of loop `n, %DaemonLog%
	;msgbox, breakout!										;Both phones are away from home otherwise it wouldn't have broken out of the loop
	If Home_L_WIFI_State = 1
		{
		FileAppend,%A_Now% No phones detected. Turning off all house lights`n, %DaemonLog%
		}
	runwait, %3%,,Hide						;Turn off the house lights
	Home_L_WIFI_State = 0					;Let the program know that wifi is keeping the lights off. 
	sleep 30000 							;Since lights were turned off by wifi Check again every 0.5 minutes 					
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
		If (ErrorLevel=1 && A_Index > 1)
			{
			Break
			}
		else if (ErrorLevel=1)
			{
			FileAppend,%A_Now% FileReadLineError failed at line %A_Index%`n, %DaemonLog%
			}
		IfInString,PingLine,%PingYas%
			{
			PingError:=true						;Looks like we can see the phone! 
			;msgbox, found the phone at %computername%! 
			;FileAppend,%A_Now% Phone at %ComputerName% Detected!`n, %DaemonLog%
			;FileAppend,%A_Now% before bothcompsoff comparison bothcompsoff = %bothcompsoff%`n, %DaemonLog%
			if bothcompsoff > 0
				{
				;FileAppend,%A_Now% before bothcompsoff comparison bothcompsoff = %bothcompsoff%`n, %DaemonLog%
				bothcompsoff := --bothcompsoff
				}
			gosub CameBackHome					;Go check if we should turn on the lights or not
			sleep 300000						;Since the phone was detected and an action was performed start the loop again after 5 minutes. dont wanna kill phone with pings 
			break
			}
		}			
	FileDelete,%PingResults%
	If PingError != 1							;Break out of this loop only when a phone disappears
		{
		bothcompsoff := ++bothcompsoff			;Add to the bothcompsoff variable to let someone know that one phone disappeared 
		;FileAppend,%A_Now% after add bothcompsoff = %bothcompsoff%`n, %DaemonLog%
		If Home_L_WIFI_State = 1
			{
			FileAppend,%A_Now% home_L_WIFI_state = %Home_L_WIFI_State% bothcompsoff = %bothcompsoff%`n, %DaemonLog%
			FileAppend,%A_Now% Phone at %ComputerName% Not seen`n, %DaemonLog%
			}
		break									
		}
	}
return

CameBackHome:
;Looks like the phone is back on, check if homestate is off, if it's off then obviously 
If Home_L_WIFI_State = 0				;Did the lights get turned off because wifi? Yes? Proceed... 
	{
	;msgbox, phone came back home!!!
	FileAppend,%A_Now% Device at %computername% detected! Lights were turned off via Wifi before so... `nTurning on house lights according to schedule!`n, %DaemonLog%
	Home_L_WIFI_State = 1				;Mark that we're turning the lights back on becuase of wifi! 
	#include Wifi_Return_sch.ahk		;Include the schedule to go through when you return with your phone
	}

Return
