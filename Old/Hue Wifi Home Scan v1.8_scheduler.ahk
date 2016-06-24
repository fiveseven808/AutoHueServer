#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force
PingResults:="HWHS17_PingResults.txt"
PingYas:="bytes=32"
Clickcount = 0
bothcompsoff = 0
Home_L_WIFI_State = 1			;Master state of all the lights int he house. i.e. if it's 0, don't let any lights power on. If it's 1 then lights are free to do whatever 

#Include Add_INI.ahk			;Pull in other variables. 
	
;WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"	;should be added via ini file
;WHClocation = "C:\Program Files\WinHue 3\whc.exe"			;should be added via ini file

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

------------------
bleh, fuck notes
6/20/16
	- moved the sleep from within the gosub checkcompon subroutine to main. before it would just kind of get hung up on one phone and if he phone stopped responding it wold look for the other. 
		but my android phone shuts off wifi if not in use i guess... and so my phone would appear to not be around
		if i ping both phones, and if one phone is seen, wait 5 minutes, then at least both phones get some pings every 5 minutes. maybe keeping wifi alive... we'll see
		
--------------------
next iteration:
run off of ini file for IPs. specify number of IPs in ini or command line. i..e "program.ahk 3" 
then you an specify more IPs and computer names as well! like my laptop! 
*/

Main:
{
FileDelete,%PingResults%
If 0 > 0
	{
	Computername = %1%
	Computername2 = %2%
	FileAppend,------------------------------------------------------------------------------------------`n, %DaemonLog%
	FileAppend,%A_Now% Now starting %A_ScriptName%! mod 6/20/16 `nRunning on %A_ComputerName% from path %WHClocation%`n, %DaemonLog%
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
		if (bothcompsoff <= 1)
			sleep 300000					;Since a phone was detected and an action was performed start the loop again after 5 minutes. dont wanna kill phone with pings 
		else If (bothcompsoff >= 4)				;Break out of this ONLY when a phone hasn't been seen 4x i.e. it's still looping if it sees a phone
			break									
		}
	;msgbox, breakout!										;Both phones are away from home otherwise it wouldn't have broken out of the loop
	If Home_L_WIFI_State = 1
		{
		FileAppend,%A_Now% No phones detected. Turning off all house lights`, set lstate to 0`n, %DaemonLog%
		Home_L_WIFI_State = 0					;Let the program know that wifi is keeping the lights off. 
		}
	runwait, %3%,,Hide						;Turn off the house lights
	;FileAppend,%A_Now% broke out of loop`,  shut off the lights and now sleeping for 1 min  `n, %DaemonLog%
	sleep 60000 							;Since lights were turned off by wifi Check again every 0.5 minutes 					
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
			PingError:=true							;Looks like we can see the phone! 
			;FileAppend,%A_Now% Phone at %ComputerName% Detected!`n, %DaemonLog%
			bothcompsoff = 0						; Reset phone counter if at least one phone is spotted!
			If Home_L_WIFI_State = 0				;Did the lights get turned off because wifi? Yes? Proceed... 
				{
				FileAppend,%A_Now% Device at %computername% detected! Lights were turned off via Wifi before so... `nTurning on house lights according to schedule!`n, %DaemonLog%
				Home_L_WIFI_State = 1				;Mark that we're turning the lights back on becuase of wifi! 
				Runwait Wifi_Return_sch.ahk		;RunWait the schedule to go through when you return with your phone
				}
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
