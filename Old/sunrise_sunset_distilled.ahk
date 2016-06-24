#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Settings
weatherurlsunrise = http://www.google.com/search?q=sunrise+96792
weatherurlsunset = http://www.google.com/search?q=sunset+96792

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
stringmid, sunrise, fileinsunrise, %sunriseloc%, 4 ;6 for am
stringmid, sunset, fileinsunset, %sunsetloc%, 4 ;6 for pm

StringReplace, sunset, sunset, :
StringReplace, sunrise, sunrise, :
sunset := sunset + 1200


;this is the output if you want to see it. 
;msgbox, sunrise = %sunrise% and sunset = %sunset%