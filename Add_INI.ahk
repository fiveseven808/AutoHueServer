;Includeini file :] 
	;[General]
	IniRead, FilePath, Config.ini, General, FilePath 
	IniRead, RemFilePath, Config.ini, General, RemFilePath 
	IniRead, CMTracePathFile, Config.ini, General, CMTracePathFile  
	IniRead, BackOnlineFile, Config.ini, General, BackOnlineFile
	IniRead, EncoderFile, Config.ini, General, EncoderFile
	
	;[HueDaemon]
	IniRead, DaemonLog, Config.ini, HueDaemon, DaemonLog 
	IniRead, WHClocation, Config.ini, HueDaemon, WHClocation 
	IniRead, OFF_File, Config.ini, HueDaemon, OFF_File
	IniRead, Scheduler_File, Config.ini, HueDaemon, Scheduler_File