;Includeini file :] 
	;[General]
	IniRead, FilePath, %inilocation%, General, FilePath 
	IniRead, RemFilePath, %inilocation%, General, RemFilePath 
	IniRead, CMTracePathFile, %inilocation%, General, CMTracePathFile  
	IniRead, BackOnlineFile, %inilocation%, General, BackOnlineFile
	IniRead, EncoderFile, %inilocation%, General, EncoderFile
	
	;[HueDaemon]
	IniRead, DaemonLog, %inilocation%, HueDaemon, DaemonLog 
	;IniRead, WHClocation, %inilocation%, HueDaemon, WHClocation 
	IniRead, OFF_File, %inilocation%, HueDaemon, OFF_File
	IniRead, Scheduler_File, %inilocation%, HueDaemon, Scheduler_File