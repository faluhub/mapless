#NoEnv
#SingleInstance Force
#Persistent

SetKeyDelay, 0

global instance
WinGet, all, list

Loop, %all% {
    WinGet, pid, PID, % "ahk_id " all%A_Index%
    WinGetTitle, title, ahk_pid %pid%
    if (InStr(title, "Minecraft")) {
        instance := pid
        Break
    }
}

isFirstCopy := 2
isFirstSeed := 1

OnClipboardChange:
    if (isFirstCopy == 0) {
        if (A_EventInfo == 1) {
            Send, {LButton}
            WinActivate, ahk_pid %instance%

            if (isFirstSeed == 0) {
                Send, {Shift down}{Tab}{Tab}{Tab}{Tab}{Shift up}{Enter}{Shift down}{Tab}{Tab}{Tab}{Shift up}{Enter}
                Sleep, 700
            } else {
                isFirstSeed = 0
            }

            Send, {Shift down}{Tab}{Enter}{Shift up}{LControl down}av{LControl up}{Tab}{Tab}{Enter}{Shift down}{Tab}{Shift up}{Enter}
        }
    } else {
        isFirstCopy -= 1
    }

return