WHClocation = "C:\Program Files\WinHue 3\whc.exe"
lightorgroup = l:5

Startup:
{
If 0 > 0
	{
	lightorgroup = %1%
	offset = %2%
	Goto Main
	}
	else
	{
	Msgbox, Must be run in command line with switches `n`n"Passing clouds.ahk" [l:(lightnumber) | g:(groupnumber)] [Negative Brightnsess Offset 1:254)
	ExitApp
	}
}
Return

Main:
{
	gosub Get_rand_num
	;runwait %WHClocation% -l:5 -on:true -bri:130 -colormode:ct -hue:34282 -sat:165 -ct:153 -tt:%rand%
	B_offset := 130-offset
	PingCmd:= WHClocation . " -" . lightorgroup . " -on:true -bri:" . B_offset . " -colormode:ct -hue:34282 -sat:165 -ct:153 -tt:" . rand
	;msgbox, %pingcmd%
	RunWait %comspec% /c """%PingCmd%""",,Hide
	sleep, %sleeptt%
	sleep, %sleeprand%
	
	gosub Get_rand_num
	;runwait %WHClocation% -l:5 -on:true -bri:254 -colormode:ct -hue:34533 -sat:240 -ct:240 -tt:%rand%
	B_offset := 254-offset
	PingCmd:= WHClocation . " -" . lightorgroup . " -on:true -bri:" . B_offset . " -colormode:ct -hue:34533 -sat:240 -ct:240 -tt:" . rand
	RunWait %comspec% /c """%PingCmd%""",,Hide
	sleep, %sleeptt%
	sleep, %sleeprand%
goto main
}

Get_rand_num:
	Random, rand, 10, 100
	Random, sleeprand, 1000, 15000
	sleeptt := rand*100
return
