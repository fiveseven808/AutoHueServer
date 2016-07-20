#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force
;7/13/16 updated this for v3.3 button daemon

run, "AmazonButton_v3.3.exe" 192.168.1.185 "TML.bat" "Mika's light"
run, "AmazonButton_v3.3.exe" 192.168.1.163 "ON_Brian_Amazon_Button.ahk" "163 brians amazon button"
run, "AmazonButton_v3.3.exe" 192.168.1.136 "ON_Amazon_Button.ahk" "136 on amazon button"
run, "AmazonButton_v3.3.exe" 192.168.1.153 "T_F_Door.bat" "ON front door"
run, "AmazonButton_v3.3.exe" 192.168.1.229 "..\Wifi_Return_sch.ahk" "229 ON living room"