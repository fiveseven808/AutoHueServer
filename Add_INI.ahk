;Includeini file :] 
	;[HueDaemon]
	IniRead, DaemonLog, %inilocation%, HueDaemon, DaemonLog 
	IniRead, OFF_File, %inilocation%, HueDaemon, OFF_File
	IniRead, Scheduler_File, %inilocation%, HueDaemon, Scheduler_File
	IniRead, detectedtimeout, %inilocation%, HueDaemon, Detected_Timeout
	
IfExist, C:\Program Files (x86)\WinHue 3\whc.exe
    WHClocation = "C:\Program Files (x86)\WinHue 3\whc.exe"
IfExist, C:\Program Files\WinHue 3\whc.exe
    WHClocation = "C:\Program Files\WinHue 3\whc.exe"