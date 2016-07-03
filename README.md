AutoHueServer
=============
## Automatic Philips Hue Server


### Summary: Updated 7/2/2016
Schedule your Philips Hue lights with Wifi-based Geofencing! Uses your phone's IP to determine if you're home!  

###### If you're lazy and just want things to "work" a basic wifi based geofencing version is available at \Prod\Package\Prod 2016_0702.7z  
###### Instructions are located in that directory 

### Bonus:

>  * Whole House "Scene" Creator  
>  * Run according to a schedule or Toggle a light (or group of lights) with an Amazon Dash Button!  


**Instructions as of 6/23/16**  
**Requirements:**

  * Install [WinHue 3 BETA 15](https://github.com/Hyrules/WinHue3) or greater
  * Install [AutoHotKey](https://autohotkey.com/download/) (to run or compile the AHK files)
	
**Instructions:**

  1. Double click "Hue Wifi Home Scan v1.9_scheduler.ahk" to understand syntax
  2. Modify Wifi\_Return_sch.ahk to suit your needs (get light numbers and light specs with WinHue's WHC.exe)
		
		  	 
**Wishlist:**

  * Proper animation handling (and creation?!, depends if WinHue will beat me to it) 
  * Proper GUI based scheduling (instead of modifying an AHK)
  * The ability to save and replay whole house scenes without relying on AHK... maybe make batch files from computer specific attributes. i.e. scenes only work per house which would make sense. 
	