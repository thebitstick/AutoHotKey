;-----------------------------------------
; AutoHotKey Script for Almost Complete Mac Keyboard Transformation for Windows 11 but for PC Keyboards
; AutoHotKey Version:		1.x
; Language:					English
; Platform:					Windows 10/11
; Author:					TheBitStick
;=========================================

; --------------------------------------------------------------
; Key
; --------------------------------------------------------------

; ! = Option (Command)
; ^ = Control
; + = Shift
; # = Meta


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

;RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableLockWorkstation, 0


; --------------------------------------------------------------
; Base System Remappings
; --------------------------------------------------------------

LAlt::							LCtrl
LWin::							return
CapsLock::						return


; --------------------------------------------------------------
; Additional System Remappings
; --------------------------------------------------------------

!+z::							Send, ^y
!#Esc::							Send, ^+{Esc}
!^Space::						Run, charmap.exe ; buggy, be sure to press Command first before pressing Control
!^f::							Send, {F11}
<!Tab::							AltTab
!+3::							Send, ~#{PrintScreen}
!+4::							Send, ~#+s
!,::							Send, ^,

!^q::							DllCall("LockWorkStation")
!+q::							DllCall("ExitWindowsEx")

!#v::							Send, ^!v
	#IfWinActive ahk_exe explorer.exe
		!#v::					Send, ^v
	#IfWinActive
![::							Send, !{Left}
!]::							Send, !{Right}
!^Up::							Send, !{Up}
!+BS::							FileRecycleEmpty
!#+BS::							FileRecycleEmpty
!F3::							Send, #d
!+{::							Send, ^l
!+}::							Send, ^r
!+\::							Send, ^e
!#f::							Send, ^f
!#c::							Send, ^!c
!#+v::							Send, ^!+v


; --------------------------------------------------------------
; Basic Translations (from Control+* to Command+* [and some Command+Shift+*])
; --------------------------------------------------------------

!a::							Send, ^a
!b::							Send, ^b
!c::							Send, ^c
!d::							Send, ^d
!e::							Send, ^e
!f::							Send, ^f
!g::							Send, ^g
!h::							Send, ^h
!i::							Send, ^i
	#IfWinActive ahk_exe explorer.exe
		!i::					Send, !{Enter}
	#IfWinActive
!j::							Send, ^j
!k::							Send, ^k
!l::							Send, ^l
!m::							WinMinimize, A
!n::							Send, ^n
!o::							Send, ^o
	#IfWinActive ahk_exe explorer.exe
		!o::					Send, {Enter}
	#IfWinActive
!p::							Send, ^p
!q::							Send, !{F4}
!r::							Send, ^r
!s::							Send, ^s
!t::							Send, ^t
!u::							Send, ^u
	#IfWinActive ahk_exe explorer.exe
		!u::					Send, {F2}
	#IfWinActive
!v::							Send, ^v
!w::							Send, ^w
!x::							Send, ^x
!y::							Send, ^y
!z::							Send, ^z

!+a::							Send, ^+a
!+i::							Send, ^+i
!+j::							Send, ^+j
!+m::							Send, ^+m
!+n::							Send, ^+n
!+p::							Send, ^+p
!+s::							Send, ^+s
!+t::							Send, ^+t
!+v::							Send, ^+v

!1::							Send, ^1
	#IfWinActive ahk_exe explorer.exe
		!1::					Send, ^+3
	#IfWinActive
!2::							Send, ^2
	#IfWinActive ahk_exe explorer.exe
		!2::					Send, ^+5
	#IfWinActive
!3::							Send, ^3
	#IfWinActive ahk_exe explorer.exe
		!3::					Send, ^+8
	#IfWinActive
!4::							Send, ^4
	#IfWinActive ahk_exe explorer.exe
		!4::					Send, ^+1
	#IfWinActive
!5::							Send, ^5
	#IfWinActive ahk_exe explorer.exe
		!5::					Send, ^+6
	#IfWinActive
!6::							Send, ^6
!7::							Send, ^7
!8::							Send, ^8
!9::							Send, ^9
!0::							Send, ^0


; --------------------------------------------------------------
; Media Key Remappings
; --------------------------------------------------------------

;F7::							Media_Prev
;F8::							Media_Play_Pause
;F9::							Media_Next
;F10::							Volume_Mute
;F11::							Volume_Down
;F12::							Volume_Up


; --------------------------------------------------------------
; Text Manipulation
; --------------------------------------------------------------

!Left::							Send, {Home}
	#IfWinActive ahk_exe firefox.exe
		!Left::					Send, !{Left}
	#IfWinActive
!Right::						Send, {End}
	#IfWinActive ahk_exe firefox.exe
		!Right::				Send, !{Right}
	#IfWinActive

!Up::							Send, {LCtrl Down}{Home}{LCtrl Up}
	#IfWinActive ahk_exe explorer.exe
		!Up::					Send, !{Up}
	#IfWinActive
!Down::							Send, {LCtrl Down}{End}{LCtrl Up}
	#IfWinActive ahk_exe explorer.exe
		!Down::					Send, {Enter}
	#IfWinActive

!+Left::						Send, {Shift Down}{Home}{Shift Up}
!+Right::						Send, {Shift Down}{End}{Shift Up}
!+Up::							Send, {Ctrl Down}{Shift Down}{Home}{Shift Up}{Ctrl Up}
!+Down::						Send, {Ctrl Down}{Shift Down}{End}{Shift Up}{Ctrl Up}

#Left::							Send, {Ctrl Down}{Left}{Ctrl Up}
#Right::						Send, {Ctrl Down}{Right}{Ctrl Up}

#+Left::						Send, {Ctrl Down}{Shift Down}{Left}{Shift Up}{Ctrl Up}
#+Right::						Send, {Ctrl Down}{Shift Down}{Right}{Shift Up}{Ctrl Up}

!BS::							Send, {LShift Down}{Home}{LShift Up}{Del}
	#IfWinActive ahk_exe explorer.exe
		!BS::					Send, {Del}
	#IfWinActive
#BS::							Send, {LCtrl Down}{BS}{LCtrl Up} ; currently non-working due to LAlt disablement


; --------------------------------------------------------------
; Special Characters (sorry I'm American, no diacritics)
; --------------------------------------------------------------

LWin & -::						Send, –

#If, GetKeyState("LShift", "P")
LWin & -::						Send, —
#If


; --------------------------------------------------------------
; Etc
; --------------------------------------------------------------

!Enter::						Send, ^{Enter}
!+Enter::						Send, ^+{Enter}
<!LButton::						Send, ^{Click}
<^LButton::						Click, Right


; --------------------------------------------------------------
; Rectangle (Mac window manager) shortcuts I use
; --------------------------------------------------------------

^#c::
	WinGetTitle, windowName, A
	WinGetPos,,, Width, Height, %windowName%
    WinMove, %windowName%,, (A_ScreenWidth - Width) / 2, (A_ScreenHeight - Height) / 2
return
