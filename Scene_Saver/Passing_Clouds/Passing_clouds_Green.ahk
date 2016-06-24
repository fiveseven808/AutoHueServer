WHClocation = "C:\Program Files\WinHue 3\whc.exe"
lightorgroup = l:5

Startup:
{
If 0 > 0
	{
	lightorgroup = %1%
	Goto Main
	}
	else
	{
	Msgbox, Must be run in command line with switches `n`n"Passing clouds.ahk" [l:(lightnumber) | g:(groupnumber)]
	ExitApp
	}
}
Return

Main:
{
	gosub Get_rand_num
	;runwait %WHClocation% -l:5 -on:true -bri:130 -colormode:ct -hue:34282 -sat:165 -ct:153 -tt:%rand%
	PingCmd:= WHClocation . " -" . lightorgroup . " -on:true -bri:254 -x:0.3789 -y:0.4586 -sat:254 -tt:" . rand
	;msgbox, %pingcmd%
	RunWait %comspec% /c """%PingCmd%""",,Hide
	sleep, %sleeptt%
	sleep, %sleeprand%
	sleepold = %sleeprand%
	rerandom:	
		gosub Get_rand_num
		if (sleeprand < sleepold)
			{
			;msgbox, sleeprand is too small! %sleeprand% < %sleepold%
			goto rerandom
			}			
		;runwait %WHClocation% -l:5 -on:true -bri:254 -colormode:ct -hue:34533 -sat:240 -ct:240 -tt:%rand%
		PingCmd:= WHClocation . " -" . lightorgroup . " -on:true -bri:127 -sat:165 -ct:153 -tt:" . rand
		RunWait %comspec% /c """%PingCmd%""",,Hide
		sleep, %sleeptt%
		sleep, %sleeprand%
goto main
}

Get_rand_num:
	Random, rand, 4, 100
	Random, sleeprand, 1000, 10000
	sleeptt := rand*100
return
