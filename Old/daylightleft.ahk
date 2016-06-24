#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Settings
run = 1 ;Update every x hours
weatherurlsunrise = http://www.google.com/search?q=sunrise+96792
weatherurlsunset = http://www.google.com/search?q=sunset+96792

;make gui
gui, add, text, x10 y10 w10, Sunrise:
gui, add, text, vsunrise x+10 w60 h20

gui, add, text, x10 w10 w10, Sunset:
gui, add, text, vsunset x+12 w60 h20

gui, add, progress, vprogressbar x10 w500 h20 cyellow, 0

gui, add, text, vt1, Sunlight remaining:
gui, font, s20
gui, add, text, y+5 vhoursleft w50, Processing...
gui, font, s12

gui, add, button, x10 y+20 gprocess, Update

gui, font, s20
gui, add, text, right vcurtime x360 y10 w150
gui, font, s12

Gui, Color, 7D9BE3

gui, show,,Daylight Remaining



;setup timers
hours:=run*1000*60*60
gosub, updatetime
gosub, process

settimer, process, %hours%
settimer, updatetime, 5000
return


process:
URLDownloadToFile, %weatherurlsunrise% , daylightsunrise.htm
URLDownloadToFile, %weatherurlsunset% , daylightsunset.htm
fileread, fileinsunrise, daylightsunrise.htm
fileread, fileinsunset, daylightsunset.htm
FileDelete, daylightsunrise.htm
FileDelete, daylightsunset.htm

;Find the position of the AM and PM times.
sunriseloc := RegExMatch(fileinsunrise, "\d+:\d+am")

sunsetloc := RegExMatch(fileinsunset, "\d+:\d+pm")


;Strip out the AM and PM times to  variables.
stringmid, sunrise, fileinsunrise, %sunriseloc%, 6
stringmid, sunset, fileinsunset, %sunsetloc%, 6

;msgbox, sunrise = %sunrise% and sunset = %sunset%

;Test Fields
;sunrise =  8:00 AM
;sunset = 8:00 PM

;split into hours and minutes
loop, parse, sunrise, :
   {
      if (A_Index = 1)
         sunriseh:=A_LoopField
      else if (A_Index = 2)
         sunrisemampm:=A_LoopField
   }   
loop, parse, sunrisemampm, %a_space%
   {
      if (A_Index = 1)
         sunrisem:=A_LoopField
      else if (A_Index = 2)
         sunriseampm:=A_LoopField
}
loop, parse, sunset, :
   {
      if (A_Index = 1)
         sunseth:=A_LoopField
      else if (A_Index = 2)
         sunsetmampm:=A_LoopField
   }   
loop, parse, sunsetmampm, %a_space%
   {
      if (A_Index = 1)
         sunsetm:=A_LoopField
      else if (A_Index = 2)
         sunsetampm:=A_LoopField
}

;get current time
FormatTime, curch, , HH
FormatTime, curcm, , mm

;Test Fields
;curch=24
;curcm=00

;update gui with values
GuiControl,,sunrise,%sunriseh%:%sunrisem% %sunriseampm%
GuiControl,,sunset,%sunseth%:%sunsetm% %sunsetampm%

;figure out difference between current time and sunset
sunseth:=sunseth+12 ;add 12 becuase the sun sets in the afternoon

;calculate hours remaining
if (sunriseh < curch)
   {
      sundif:=sunseth-curch
   }
Else
   sundif=0

;calculate progres bar value
totalhours := sunseth-sunriseh
progresrate := 100/totalhours
progressset := progresrate * sundif

if(sundif<0)
   sundif=0

;update gui with values
GuiControl,,hoursleft, %sundif%
GuiControl,,progressbar, %progressset%

Return

updatetime:
FormatTime, curh, , h
FormatTime, curm, , mm
FormatTime, curampm, , tt

;Test Fields
;curh:=curch
;curm:=curcm
;curampm=PM

GuiControl,,curtime, %curh%:%curm% %curampm%
return

reload:
Reload
Return

guiclose:
GuiEscape:
ExitApp