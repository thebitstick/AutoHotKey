#InstallKeybdHook
#SingleInstance Force
SetTitleMatchMode 2
SendMode Input

if not A_IsAdmin

  Run *RunAs "%A_ScriptFullPath%"

^!c::
	WinGetTitle, windowName, A
	WinGetPos,,, Width, Height, %windowName%
    WinMove, %windowName%,, (A_ScreenWidth - Width) / 2, (A_ScreenHeight - Height) / 2
return