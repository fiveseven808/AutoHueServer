/*
This program runs and checks every minute or so. 

Starts your daily scheudle based on the sunrise and sunset times. 
also incorporates alarm? 
*/
main:
	;gosub getreadyforbed
	gosub lastonetobed
return

/*
If a_hour < 18											;If we come home before 6pm
		runwait %WHClocation% -l:5 -ct:155 -bri:254		 	;6pm Concentrate
	If a_hour > 18
		{
		runwait %WHClocation% -sn:l5pzDCnp7oNFqOi		 	;Turn on Group2: 6pm Concentrate
		runwait %WHClocation% -g:4 -bri:191					;Turn on Hallway light to 75%	
		}		
	If a_hour > 20											;If we come home after 8 
		{
		;runwait %WHClocation% -g:0 -on:true -bri:254  		;Turn all lights on 
		runwait %WHClocation% -sn:rILZ32dtgZEFHDm			;Turn on Group 2: Main Night 100% warm 
		;runwait %WHClocation% -l:5 -bri:127 -ct:343
		runwait %WHClocation% -g:4 -on:true -bri:191					;Turn on Hallway light to 75%	
		runwait %WHClocation% -sn:Eaf10R5GyAgUoYO			;Turn on Group 1: Reading Normal
		runwait %WHClocation% -g:3 -on:true -bri:1					;Turn on Bathroom to 1%				
		}
	If a_hour < 6
		{
		runwait %WHClocation% -g:0 -bri:254 -ct:343 		;Turn all lights on 
		runwait %WHClocation% -sn:rILZ32dtgZEFHDm			;Turn on Group 2: Main Night 100% warm 
		;runwait %WHClocation% -l:5 -bri:127 -ct:343
		runwait %WHClocation% -g:4 -bri:191					;Turn on Hallway light to 75%	
		runwait %WHClocation% -sn:Eaf10R5GyAgUoYO			;Turn on Group 1: Reading Normal
		runwait %WHClocation% -g:3 -bri:1					;Turn on Bathroom to 1%		
		}		
*/
		
		
getreadyforbed:
;msgbox, get ready for bed 
;getting ready for bed schedule
;make sure everything is on and at half brightness
runwait %WHClocation% -g:0 -on:true -bri:127
runwait %WHClocation% -g:3 -bri:1 
return

lastonetobed:
;msgbox, last to bed
;last one left to go to bed
runwait %WHClocation% -l:8 -on:true -bri:63 			;Brian's light to 25%r
runwait %WHClocation% -l:5 -on:true -bri:1 -ct:340		;main light to 1 brigt and warm color 
runwait %WHClocation% -l:2 -on:false
runwait %WHClocation% -g:3 -on:false
runwait %WHClocation% -g:4 -on:false 
return
