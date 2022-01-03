;-----------------------------------------
; AutoHotKey Script for Almost Complete Mac Keyboard Transformation for Windows 11
;=========================================

; --------------------------------------------------------------
; Key
; --------------------------------------------------------------

; ! = ALT (Option)
; ^ = CTRL (Control)
; + = SHIFT (Shift)
; # = WIN (Command)


; --------------------------------------------------------------
; Setup
; --------------------------------------------------------------

#InstallKeybdHook
#InstallMouseHook
#SingleInstance Force
SetTitleMatchMode 2
SendMode Input

if not A_IsAdmin
	Run *RunAs "%A_ScriptFullPath%"
return

RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableLockWorkstation, 1


; --------------------------------------------------------------
; Base System Remappings
; --------------------------------------------------------------

~Alt::							Send, {Alt}
LWin::							LCtrl
CapsLock::						return


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
#i::							Send, ^i
#j::							Send, ^j
#k::							Send, ^k
#l::							Send, ^l
#n::							Send, ^n
#o::							Send, ^o
#p::							Send, ^p
#r::							Send, ^r
#s::							Send, ^s
#t::							Send, ^t
#u::							Send, ^u
#v::							Send, ^v
#w::							Send, ^w
#x::							Send, ^x
#y::							Send, ^y
#z::							Send, ^z

#1::							Send, ^1
#2::							Send, ^2
#3::							Send, ^3
#4::							Send, ^4
#5::							Send, ^5
#6::							Send, ^6
#7::							Send, ^7
#8::							Send, ^8
#9::							Send, ^9
#0::							Send, ^0

#+i::							Send, ^+i
#+m::							Send, ^+m
#+n::							Send, ^+n
#+p::							Send, ^+p
#+t::							Send, ^+t
#+v::							Send, ^+v
#+z::							Send, ^y


; --------------------------------------------------------------
; Screenshot Remappings
; --------------------------------------------------------------

#+3::							Send, #{PrintScreen}
#+4::							Send, #+s


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

#Up::							Send, {LCtrl Down}{Home}{LCtrl Up}
#Down::						Send, {LCtrl Down}{End}{LCtrl Up}

#+Left::						Send, {Shift Down}{Home}{Shift Up}
#+Right::						Send, {Shift Down}{End}{Shift Up}
#+Up::							Send, {Ctrl Down}{Shift Down}{Home}{Shift Up}{Ctrl Up}
#+Down::						Send, {Ctrl Down}{Shift Down}{End}{Shift Up}{Ctrl Up}

!Left::							Send, {Ctrl Down}{Left}{Ctrl Up}
!Right::						Send, {Ctrl Down}{Right}{Ctrl Up}

!+Left::						Send, {Ctrl Down}{Shift Down}{Left}{Shift Up}{Ctrl Up}
!+Right::						Send, {Ctrl Down}{Shift Down}{Right}{Shift Up}{Ctrl Up}

#BS::							Send, {LShift Down}{Home}{LShift Up}{Del}
!BS::							Send, {LCtrl Down}{BS}{LCtrl Up}

!-::							Send, {U+2013}
!+-::							Send, {U+2014}


; --------------------------------------------------------------
; For Mozilla Firefox
; --------------------------------------------------------------

#IfWinActive ahk_class MozillaWindowClass
#]::							Send, !{Left}
#[::							Send, !{Right}
#IfWinActive


; --------------------------------------------------------------
; Etc
; --------------------------------------------------------------

#,::							Send, ^,
#q::							Send, !{F4}
LWin & Enter::					Send, ^{Enter}
LWin & LButton::				Send, {Ctrl Down}{Click}{Ctrl Up}

#m::							WinMinimize, A
LWin & Tab::					AltTab
LCtrl & LButton::				Click, Right
