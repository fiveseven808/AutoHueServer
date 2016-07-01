#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force

run, "AmazonButton_v3.2.exe" 192.168.1.185 "TML.bat"
run, "AmazonButton_v3.2.exe" 192.168.1.163 "ON_Amazon_Button.ahk"
run, "AmazonButton_v3.2.exe" 192.168.1.136 "ON_Amazon_Button.ahk"