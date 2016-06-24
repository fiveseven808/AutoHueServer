;List of times and actions that will happen when the phone reconnects to Wifi
ftime := a_hour . a_min													;Format time in a HHmm way 
;msgbox wat = %ftime%
	If ftime < 600														;If we come home before 6am
		{
		runwait %WHClocation% -g:0 -on:true -bri:254 -ct:343 			;Turn all lights on 
		runwait %WHClocation% -sn:rILZ32dtgZEFHDm						;Turn on Living Room (g2): Main Night 100% warm 
		runwait %WHClocation% -g:4 -on:true -bri:191					;Turn on Hallway light to 75%	
		runwait %WHClocation% -sn:Eaf10R5GyAgUoYO						;Turn on Group 1: Reading Normal
		runwait %WHClocation% -g:3 -on:true -bri:1						;Turn on Bathroom to 1%		
		}	
	If ftime <= 1200														;If we come home before noon
		runwait %WHClocation% -l:5 -on:true -ct:155 -bri:254		 	;6pm Energize
	If ftime < 1800														;If we come home before 6pm
		{
		msgbox wat = %ftime%											
		runwait %WHClocation% -l:5 -on:true -ct:220	-bri:188	 		;6pm Concentrate
		;sleep 600000													;Wait about 10 minutes, then bring it to green
		runwait %WHClocation% -sn:1WHGpel2QbjsaUD						;Turn green
		tempmath := a_hour - 12
		tempmath := tempmath / 5
		tempmath := 1-tempmath
		tempmath := (tempmath * 127) + 127
		StringLeft, tempmath, tempmath, 3
		runwait %WHClocation% -l:5 -on:true -bri:%tempmath%				;The closer it gets to 5pm, the closer the light gets to 50% brightness from 100% 
		}
	If ftime >= 1800														;If we come home after 6pm
		{
		runwait %WHClocation% -sn:l5pzDCnp7oNFqOi		 				;Turn on Group2: 6pm Concentrate
		runwait %WHClocation% -g:4 -on:true -bri:191					;Turn on Hallway light to 75%	
		}		
	If ftime > 2000														;If we come home after 8 
		{
		runwait %WHClocation% -sn:rILZ32dtgZEFHDm						;Turn on Living Room (g2): Main Night 100% warm 
		runwait %WHClocation% -g:4 -on:true -bri:191					;Turn on Hallway light to 75%	
		runwait %WHClocation% -sn:Eaf10R5GyAgUoYO						;Turn on Group 1: Reading Normal
		runwait %WHClocation% -g:3 -on:true -bri:1						;Turn on Bathroom to 1%		
		}
	
	

/*
Times when you would come home
Before you wake up
Before noon
After noon
Before you come home from work

*/