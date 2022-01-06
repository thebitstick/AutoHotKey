;-----------------------------------------
; AutoHotKey Script for Almost Complete Mac Keyboard Transformation for Windows 11
; AutoHotKey Version:		1.x
; Language:					English
; Platform:					Windows 10/11
; Author:					TheBitStick
;=========================================

; --------------------------------------------------------------
; Key
; --------------------------------------------------------------

; ! = Option
; ^ = Control
; + = Shift
; # = Meta (Command)


; --------------------------------------------------------------
; Setup
; --------------------------------------------------------------

#InstallKeybdHook
#InstallMouseHook
#SingleInstance Force
SetTitleMatchMode 2
SendMode Input

if !InStr(A_AhkPath, "_UIA.exe") {
	newPath := RegExReplace(A_AhkPath, "\.exe", "U" (A_Is64bitOS ? 64 : 32) "_UIA.exe")
	Run % StrReplace(DllCall("Kernel32\GetCommandLine", "Str"), A_AhkPath, newPath)
	ExitApp
}

RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableLockWorkstation, 1


; --------------------------------------------------------------
; Base System Remappings
; --------------------------------------------------------------

LWin::							LCtrl
LAlt::							return
CapsLock::						return


; --------------------------------------------------------------
; Additional System Remappings
; --------------------------------------------------------------

#+z::							Send, ^y
#!Esc::							Send, ^+{Esc}
#^Space::						Run, charmap.exe ; buggy, be sure to press Command first before pressing Control
#^f::							Send, {F11}
<#Tab::							AltTab
#+3::							Send, ~#{PrintScreen}
#+4::							Send, ~#+s
#,::							Send, ^,

#^q::							DllCall("LockWorkStation")
#+q::							DllCall("ExitWindowsEx")

#!v::
	if WinActive("ahk_exe explorer.exe")
								Send, ^v
	else
								Send, ^!v
	return
#[::							Send, !{Left}
#]::							Send, !{Right}
#^Up::							Send, !{Up}
#+BS::							FileRecycleEmpty
#!+BS::							FileRecycleEmpty
#F3::							Send, #d
#+{::							Send, ^l
#+}::							Send, ^r
#+\::							Send, ^e
#!f::							Send, ^f
#!c::							Send, ^!c
#!+v::							Send, ^!+v


; --------------------------------------------------------------
; Basic Translations (from Control+* to Command+* [and some Command+Shift+*])
; --------------------------------------------------------------

#a::							Send, ^a
#b::							Send, ^b
#c::							Send, ^c
#d::							Send, ^d
#e::							Send, ^e
#f::							Send, ^f
#g::							Send, ^g
#h::							Send, ^h
#i::
	if WinActive("ahk_exe explorer.exe")
								Send, !{Enter}
	else
								Send, ^i
	return
#j::							Send, ^j
#k::							Send, ^k
#l::							Send, ^l
#m::							WinMinimize, A
#n::							Send, ^n
#o::
	if WinActive("ahk_exe explorer.exe")
								Send, {Enter}
	else
								Send, ^o
	return
#p::							Send, ^p
#q::							Send, !{F4}
#r::							Send, ^r
#s::							Send, ^s
#t::							Send, ^t
#u::
	if WinActive("ahk_exe explorer.exe")
								Send, {F2}
	else
								Send, ^u
	return
#v::							Send, ^v
#w::							Send, ^w
#x::							Send, ^x
#y::							Send, ^y
#z::							Send, ^z

#+a::							Send, ^+a
#+i::							Send, ^+i
#+j::							Send, ^+j
#+m::							Send, ^+m
#+n::							Send, ^+n
#+p::							Send, ^+p
#+s::							Send, ^+s
#+t::							Send, ^+t
#+v::							Send, ^+v

#1::
	if WinActive("ahk_exe explorer.exe")
								Send, ^+3
	else
								Send, ^1
	return
#2::
	if WinActive("ahk_exe explorer.exe")
								Send, ^+5
	else
								Send, ^2
	return
#3::
	if WinActive("ahk_exe explorer.exe")
								Send, ^+8
	else
								Send, ^3
	return
#4::
	if WinActive("ahk_exe explorer.exe")
								Send, ^+1
	else
								Send, ^4
	return
#5::
	if WinActive("ahk_exe explorer.exe")
								Send, ^+6
	else
								Send, ^5
	return
#6::							Send, ^6
#7::							Send, ^7
#8::							Send, ^8
#9::							Send, ^9
#0::							Send, ^0


; --------------------------------------------------------------
; Media Key Remappings
; --------------------------------------------------------------

F7::							Media_Prev
F8::							Media_Play_Pause
F9::							Media_Next
F10::							Volume_Mute
F11::							Volume_Down
F12::							Volume_Up


; --------------------------------------------------------------
; Text Manipulation
; --------------------------------------------------------------

#Left::
	if WinActive("ahk_exe firefox.exe")
								Send, !{Left}
	else
								Send, {Home}
	return

#Right::
	if WinActive("ahk_exe firefox.exe")
								Send, !{Right}
	else
								Send, {End}
	return

#Up::
	if WinActive("ahk_exe explorer.exe")
								Send, !{Up}
	else
								Send, {LCtrl Down}{Home}{LCtrl Up}
	return
#Down::
	if WinActive("ahk_exe explorer.exe")
								Send, {Enter}
	else
								Send, {LCtrl Down}{End}{LCtrl Up}
	return

#+Left::						Send, {Shift Down}{Home}{Shift Up}
#+Right::						Send, {Shift Down}{End}{Shift Up}
#+Up::							Send, {Ctrl Down}{Shift Down}{Home}{Shift Up}{Ctrl Up}
#+Down::						Send, {Ctrl Down}{Shift Down}{End}{Shift Up}{Ctrl Up}

!Left::							Send, {Ctrl Down}{Left}{Ctrl Up}
!Right::						Send, {Ctrl Down}{Right}{Ctrl Up}

!+Left::						Send, {Ctrl Down}{Shift Down}{Left}{Shift Up}{Ctrl Up}
!+Right::						Send, {Ctrl Down}{Shift Down}{Right}{Shift Up}{Ctrl Up}

#BS::
	if WinActive("ahk_exe explorer.exe")
								Send, {Del}
	else
								Send, {LShift Down}{Home}{LShift Up}{Del}
	return
!BS::							Send, {LCtrl Down}{BS}{LCtrl Up} ; currently non-working due to LAlt disablement


; --------------------------------------------------------------
; Special Characters (sorry I'm American, no diacritics)
; --------------------------------------------------------------

LAlt & -::						Send, –

#If, GetKeyState("LShift", "P")
LAlt & -::						Send, —
#If


; --------------------------------------------------------------
; Etc
; --------------------------------------------------------------

#Enter::						Send, ^{Enter}
#+Enter::						Send, ^+{Enter}
<#LButton::					Send, ^{Click}
<^LButton::						Click, Right


; --------------------------------------------------------------
; Rectangle (Mac window manager) shortcuts I use
; --------------------------------------------------------------

^!c::
	WinGetTitle, windowName, A
	WinGetPos,,, Width, Height, %windowName%
    WinMove, %windowName%,, (A_ScreenWidth - Width) / 2, (A_ScreenHeight - Height) / 2
return
