; Create a GUI with a button
Gui, Add, Button, gPingGoogle, Ping www.google.com
Gui, Show,, Internet Test
return

; Define what happens when the button is clicked
PingGoogle:
    ; Run the ping command in a hidden command prompt and save the output to a variable
    RunWait, %ComSpec% /c ping www.google.com > temp.txt, , Hide, PID
    FileRead, OutputVar, temp.txt
    FileDelete, temp.txt
    
    ; Extract the average ping from the output
    RegExMatch(OutputVar, "Average = (\d+)", match)
    AvgPing := match1
    
    ; Check the output
    if (AvgPing != "") {
        MsgBox, Internet is working. Average ping: %AvgPing% ms.
    } else {
        MsgBox, Internet is not working.
    }
return

; Close the GUI when the window is closed
GuiClose:
ExitApp
;                 Tactics
;                   _.-, 
;              _ .-'  / .._
;           .-:'/ - - \:::::-.
;         .::: '  e e  ' '-::::.
;        ::::'(    ^    )_.::::::
;       ::::.' '.  o   '.::::'.'/_
;   .  :::.'       -  .::::'_   _.:
; .-''---' .'|      .::::'   '''::::
;'. ..-:::'  |    .::::'        ::::
; '.' ::::    \ .::::'          ::::
;      ::::   .::::'           ::::
;       ::::.::::'._          ::::
;        ::::::' /  '-      .::::
;         '::::-/__    __.-::::'
;           '-::::::::::::::-'
;               '''::::'''            
