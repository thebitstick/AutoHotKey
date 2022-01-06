# AutoHotKey
Essential Scripts for Mac users stuck on Windows

# Requirements
- Latest Version of [AutoHotKey](https://www.autohotkey.com/) v1.x

# Installation
For those who use Mac keyboards (where the `⌘` key shows up as the `Windows/Meta` key on PCs), use the [Mac.ahk](https://github.com/thebitstick/AutoHotKey/blob/main/Mac.ahk) file.
For those with standard PC keyboards (where `Alt/⌥` is the closest key to the space bar), use the [Mac but PC.ahk](https://github.com/thebitstick/AutoHotKey/blob/main/Mac%20but%20PC) file.

Once AutoHotKey is installed, simply launch the script and it will instantly take affect.

### Notice
The [Mac.ahk](https://github.com/thebitstick/AutoHotKey/blob/main/Mac.ahk) file disables the ability to lock your workstation due to Windows not giving up the `⊞ + L` shortcut to map `⌘ + L` to `⌃ + L`.
To disable this functionality (and thus disabling using `⌘ + L`, comment [this line](https://github.com/thebitstick/AutoHotKey/blob/33c9b5882d3977c116bc3995959270fece2dbc74/Mac.ahk#L33).

# Autostart
Simply create a shortcut for the script and move this shortcut to `%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup`.
