;Includeini file :] 
	;[General]
	IniRead, FilePath, Config.ini, General, FilePath 
	IniRead, RemFilePath, Config.ini, General, RemFilePath 
	IniRead, CMTracePathFile, Config.ini, General, CMTracePathFile  
	IniRead, BackOnlineFile, Config.ini, General, BackOnlineFile
	IniRead, EncoderFile, Config.ini, General, EncoderFile
	
	;[MainFiles]
	IniRead, FreshImageFile , Config.ini, MainFiles, FreshImageFile  
	IniRead, QueryUpdatesFile  , Config.ini, MainFiles, QueryUpdatesFile   
	
	;[FreshImage]
	IniRead, InstallerFile, Config.ini, FreshImage, InstallerFile
	IniRead, QueryLUpdatesFile, Config.ini, FreshImage, QueryLUpdatesFile 
	IniRead, FILogFile, Config.ini, FreshImage, FILogFile 
	
;ASB Installer Bits
	;[ASBInstaller]
	IniRead, ServertoMSG, Config.ini, ASBInstaller, ServertoMSG
	IniRead, UsertoMSG, Config.ini, ASBInstaller, UsertoMSG
	
;Includeini file :] 
	;[HueDaemon]
	IniRead, DaemonLog, Config.ini, HueDaemon, DaemonLog 
	IniRead, WHClocation, Config.ini, HueDaemon, WHClocation 