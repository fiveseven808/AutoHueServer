# AutoHueServer
Automatic Philips Hue Server

Summary: Schedule your Hue lights with Wifi-based Geofencing! Uses your phone's IP to determine if you're home! 

Bonus: 
	Whole House "Scene" Creator
	Run according to a schedule or Toggle a light (or group of lights) with an Amazon Dash Button!


Instructions as of 6/23/16
	Requirements:
		Install WinHue 3 BETA 15 or greater
		Install AutoHotKey (to run or compile the AHK files)
	Instructions:
		Modify WHClocation in the ini file to your WinHue location 
		Open Hue Wifi Home Scan v1.9_scheduler.ahk to understand syntax
		Modify Wifi_Return_sch.ahk to suit your needs (get light and light specs with WinHue's WHC.exe) 

First up
6/23/16
	First upload to github. 
	Files are all shitty and the directory structure is all fucked up. 
	But files are online and I can start changing and rearranging them. 
	I might have to rewrite eveything.... probably gotta clean things up...
	Goals for the upcoming build:
		 
		 
		 
Wishlist:
	Proper animation handling (and creation?!, depends if WinHue will beat me to it) 
	Proper GUI based scheduling (instead of modifying an AHK)
	