#SingleInstance Force

; Open terminal
#Enter::
    Run "wt.exe"
    Return

; Open music player
#Y::
    Run "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --app="https://music.youtube.com/"
    Return

; Run launcher
; note: a bit too ambitious perhaps

GetAllKeysPressed(mode = "L") {
    pressed := Array()
    i := 1

    keys = ``|1|2|3|4|5|6|7|8|9|0|-|=|[|]\|;|'|,|.|/|a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z|Esc|Tab|CapsLock|LShift|RShift|LCtrl|RCtrl|RWin|LAlt|RAlt|Space|AppsKey|Up|Down|Left|Right|Enter|BackSpace|Delete|Home|End|PGUP|PGDN|PrintScreen|ScrollLock|Pause|Insert|NumLock|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|F13|F14|F15|F16|F17|F18|F19|F20
    ; '|' isn't a key itself (with '\' being the "actual" key), so okay to use is as a delimiter
    Loop Parse, keys, |
    {
        key = %A_LoopField%
        isDown :=  GetKeyState(key, mode)
        if (isDown)
        {
            pressed[i] := key ; using 'i' instead of array.insert() for efficiency
            i++
        }
    }

    return pressed
}

; TODO:
; On key down, check if any other key is pressed. If true, simply break out of the function
; On key up, Send input call to PowerToys Runner
; SC01A = '['
; SC01B = ']'
; SC00A = '9'
; SC00B = '0'
;LWin::
;    foo := False
;    while GetKeyState("LWin", "P")
;    {
;        pressed := GetAllKeysPressed("P")
;        MaxIndex := pressed.MaxIndex()
;        if (MaxIndex > 1) {
;            foo := True
;        }
;    }

;    if foo {
;        msgbox "skip!"
;        return
;    } else {
;        SendInput {Alt Down}{Space}{Alt Up}
;    }

;    return

    ;======================================================
    ; the following 'for' loop could be used to see the keys being pressed
    ;======================================================
    ; Read from the array:
    ; Loop % f.MaxIndex()   ; More traditional approach.

    ; for index, element in f ; Recommended approach in most cases.
    ; {
        ; Using "Loop", indices must be consecutive numbers from 1 to the number
        ; of elements in the array (or they must be calculated within the loop).
        ; MsgBox % "Element number " . A_Index . " is " . Array[A_Index]
        
        ; Using "for", both the index (or "key") and its associated value
        ; are provided, and the index can be *any* value of your choosQLing.
        ; MsgBox % "Element number " . index . " is " . element
    ; }
    ;======================================================
    ; return
    ; SendInput {Alt Down}{Space}{Alt Up}

; Open Personal browser
#B::
    Run "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --profile-directory="Profile 2"
    Return

; Open Work browser
#^B::
    Run "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --profile-directory="Profile 1"
    Return

; Open Calendar
#C::
    Run "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --app="https://calendar.google.com/"
    Return

; Open Work Calendar
#^C::
    Run "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --app="https://calendar.google.com/" --profile-directory="Profile 1"
    Return

; Close current program
#Q::
    SendInput {Alt Down}{F4}{Alt Up}
    Return
#W::
    SendInput {Alt Down}{F4}{Alt Up}
    Return
^Q::
    SendInput {Alt Down}{F4}{Alt Up}
    Return

; Open task manager
#T::
    Run "taskmgr"
    Return

; Open Messenger
#M::
    Run "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --app="https://messenger.com" --profile-directory="Profile 2"
    Return

; Open or focus Slack
#S::
    Run "C:\Users\patrick.christensen\AppData\Local\slack\slack.exe"
    Return

; Do nothing because these are annoying honestly
#1::
    Return
#2::
    Return
#3::
    Return
#4::
    Return
#5::
    Return
#6::
    Return
#7::
    Return
#8::
    Return
#9::
    Return
#0::
   Return

