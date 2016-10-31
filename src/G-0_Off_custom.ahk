#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


IfExist, C:\Program Files (x86)\WinHue 3\whc.exe
    WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"
IfExist, C:\Program Files\WinHue 3\whc.exe
    WHClocation = "C:\Program Files\WinHue 3\whc.exe"
	
	
;Run %WHClocation% -g:0 -on:false
run %WHClocation% -l:1 -on:false -bri:2 
run %WHClocation% -l:2 -on:false -bri:1 
runwait %WHClocation% -l:5 --on:false -bri:1 -sat:195 -ct:435 
;run %WHClocation% -l:6 -on:true -bri:1 
;don't touch the bathroom
run %WHClocation% -l:7 -on:false -bri:1 -sat:1 -ct:381 
run %WHClocation% -l:8 -on:false -bri:1 -sat:1 -ct:381 
run %WHClocation% -l:9 -on:false -bri:1 -sat:195 -ct:435 
runwait %WHClocation% -l:10 -on:false -bri:1 -sat:195 -ct:435 
run %WHClocation% -l:11 -on:false -bri:1 -sat:195 -ct:435 
run %WHClocation% -l:12 -on:false -bri:254 
run %WHClocation% -l:13 -on:false -bri:254 -sat:150 -ct:375 
run %WHClocation% -l:14 -on:false -bri:250 
runwait %WHClocation% -l:15 -on:false -bri:250 -sat:1 -ct:419 
Run StopAni.exe
FileAppend,%A_Now% All lights turned OFF via CUSTOM EXE `n, %DaemonLog%