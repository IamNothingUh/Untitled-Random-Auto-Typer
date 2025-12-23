#SingleInstance Force
SetWorkingDir %A_ScriptDir%
IniFile := "types.ini"
SettingsFile := "settings.ini"

; Load Settings
IniRead, TypeSpeed, %SettingsFile%, Settings, TypeSpeed, 50
IniRead, SoundEnabled, %SettingsFile%, Settings, SoundEnabled, 1
IniRead, AnimEnabled, %SettingsFile%, Settings, AnimEnabled, 1
IniRead, AlwaysTop, %SettingsFile%, Settings, AlwaysTop, 1
IniRead, Theme, %SettingsFile%, Settings, Theme, Blue

; Theme Colors
if (Theme = "Blue") {
    ThemeColor := "00D4FF"
    ThemeDark := "0066CC"
} else if (Theme = "Red") {
    ThemeColor := "FF3366"
    ThemeDark := "CC0044"
} else if (Theme = "Green") {
    ThemeColor := "00FF88"
    ThemeDark := "00AA44"
} else if (Theme = "Purple") {
    ThemeColor := "AA88FF"
    ThemeDark := "7744CC"
}

; Stats
IniRead, TotalTypes, %SettingsFile%, Stats, TotalTypes, 0
IniRead, TotalChars, %SettingsFile%, Stats, TotalChars, 0

; ================= MAIN GUI =================
TopFlag := AlwaysTop ? "+AlwaysOnTop" : ""
Gui, Main:New, %TopFlag% -Caption +Border
Gui, Main:Margin, 0, 0
Gui, Main:Color, 0a0a0a

; Custom Title Bar with Gradient
Gui, Main:Font, s12 bold c%ThemeColor%, Segoe UI
Gui, Main:Add, Progress, x0 y0 w700 h65 Background191919 Disabled
Gui, Main:Add, Text, x20 y18 w500 BackgroundTrans, ⚡ AUTO TYPER PRO - ULTIMATE
Gui, Main:Font, s9 norm cFFFFFF
Gui, Main:Add, Text, x580 y18 w30 h30 gShowSettings Center BackgroundTrans c%ThemeColor%, ⚙️
Gui, Main:Add, Text, x615 y18 w30 h30 gMinimizeGui Center BackgroundTrans, _
Gui, Main:Add, Text, x650 y18 w30 h30 gGuiClose Center BackgroundTrans c%ThemeColor%, ✕

; Tab System
Gui, Main:Font, s9 bold c%ThemeColor%
Gui, Main:Add, Progress, x0 y65 w700 h45 Background0f0f0f Disabled
Gui, Main:Add, Text, x20 y75 w100 h25 gTabTyper Center BackgroundTrans vTabTyperBtn, 📝 TYPER
Gui, Main:Add, Text, x130 y75 w100 h25 gTabLibrary Center BackgroundTrans vTabLibraryBtn, 📚 LIBRARY
Gui, Main:Add, Text, x240 y75 w100 h25 gTabTools Center BackgroundTrans vTabToolsBtn, 🔧 TOOLS
Gui, Main:Add, Text, x350 y75 w100 h25 gTabStats Center BackgroundTrans vTabStatsBtn, 📊 STATS

; Main Container
Gui, Main:Add, Progress, x15 y120 w670 h560 Background141414 Disabled

; =================== TAB 1: TYPER ===================
Gui, Main:Font, s9 bold c%ThemeColor%
Gui, Main:Add, Text, x30 y135 BackgroundTrans vTyperTab1, 📝 COMPOSE MESSAGE
Gui, Main:Font, s9 norm c888888
Gui, Main:Add, Text, x30 y155 BackgroundTrans vTyperTab2, Write your message with advanced typing simulation

; Text Input
Gui, Main:Add, Progress, x30 y180 w640 h160 Background1a1a1a Disabled vTyperTab3
Gui, Main:Font, s10 cDDDDDD, Consolas
Gui, Main:Add, Edit, x35 y185 vUserText w630 h150 Background1a1a1a c%ThemeColor% -E0x200 +Multi vTyperTab4

; Advanced Settings Row
Gui, Main:Font, s9 norm cCCCCCC, Segoe UI
Gui, Main:Add, Progress, x30 y355 w210 h110 Background1a1a1a Disabled vTyperTab5
Gui, Main:Add, Text, x45 y365 BackgroundTrans vTyperTab6, ⏱️ Delay (seconds)
Gui, Main:Font, s11 bold c%ThemeColor%
Gui, Main:Add, Edit, x45 y385 vDelay w80 h35 Number Center Background252525 c%ThemeColor% -E0x200 vTyperTab7, 3
Gui, Main:Font, s8 norm c666666
Gui, Main:Add, Text, x45 y425 w150 BackgroundTrans vTyperTab8, Time before typing starts

Gui, Main:Add, Progress, x250 y355 w210 h110 Background1a1a1a Disabled vTyperTab9
Gui, Main:Font, s9 norm cCCCCCC
Gui, Main:Add, Text, x265 y365 BackgroundTrans vTyperTab10, ⚡ Type Speed (ms)
Gui, Main:Font, s11 bold c%ThemeColor%
Gui, Main:Add, Edit, x265 y385 vTypeSpeed w80 h35 Number Center Background252525 c%ThemeColor% -E0x200 vTyperTab11, %TypeSpeed%
Gui, Main:Font, s8 norm c666666
Gui, Main:Add, Text, x265 y425 w180 BackgroundTrans vTyperTab12, Lower = Faster (10-200ms)

Gui, Main:Add, Progress, x470 y355 w200 h110 Background1a1a1a Disabled vTyperTab13
Gui, Main:Font, s9 norm cCCCCCC
Gui, Main:Add, Text, x485 y365 BackgroundTrans vTyperTab14, 🎮 Quick Actions
Gui, Main:Font, s8 bold cFFFFFF
Gui, Main:Add, CheckBox, x485 y390 vRandomize Background1a1a1a c%ThemeColor% vTyperTab15, Random Speed
Gui, Main:Add, CheckBox, x485 y415 vPasteMode Background1a1a1a c%ThemeColor% vTyperTab16, Paste Mode
Gui, Main:Add, CheckBox, x485 y440 vEnterAfter Background1a1a1a c%ThemeColor% vTyperTab17, Send Enter After

; Action Buttons
Gui, Main:Font, s11 bold cFFFFFF
Gui, Main:Add, Progress, x30 y480 w205 h80 Background%ThemeDark% Disabled vTyperTab18
Gui, Main:Add, Text, x30 y480 w205 h80 gTypeText Center BackgroundTrans vTyperTab19, ▶️ START TYPING`n(F9)

Gui, Main:Add, Progress, x245 y480 w205 h80 Background00AA44 Disabled vTyperTab20
Gui, Main:Add, Text, x245 y480 w205 h80 gSaveType Center BackgroundTrans vTyperTab21, 💾 SAVE TEXT`n(Ctrl+S)

Gui, Main:Add, Progress, x460 y480 w210 h80 BackgroundCC6600 Disabled vTyperTab22
Gui, Main:Add, Text, x460 y480 w210 h80 gClearText Center BackgroundTrans vTyperTab23, 🗑️ CLEAR ALL`n(Ctrl+X)

; Quick Templates
Gui, Main:Font, s9 bold c%ThemeColor%
Gui, Main:Add, Text, x30 y575 BackgroundTrans vTyperTab24, ⚡ QUICK TEMPLATES
Gui, Main:Font, s8 norm cCCCCCC
Gui, Main:Add, Button, x30 y595 w100 h25 gTemplate1 vTyperTab25, 👋 Greeting
Gui, Main:Add, Button, x140 y595 w100 h25 gTemplate2 vTyperTab26, 💼 Professional
Gui, Main:Add, Button, x250 y595 w100 h25 gTemplate3 vTyperTab27, 🎮 Gaming
Gui, Main:Add, Button, x360 y595 w150 h25 gTemplate4 vTyperTab28, 📋 Clipboard → Text

; =================== TAB 2: LIBRARY ===================
Gui, Main:Font, s9 bold c%ThemeColor%
Gui, Main:Add, Text, x30 y135 BackgroundTrans vLibTab1 Hidden, 📚 SAVED TEXT LIBRARY
Gui, Main:Font, s9 norm c888888
Gui, Main:Add, Text, x500 y135 BackgroundTrans vLibCount Hidden, 0 items

; Search Bar
Gui, Main:Add, Progress, x30 y160 w640 h40 Background1a1a1a Disabled vLibTab2 Hidden
Gui, Main:Font, s10 cCCCCCC
Gui, Main:Add, Edit, x40 y170 vSearchBox w620 h20 Background252525 c%ThemeColor% -E0x200 gSearchLibrary vLibTab3 Hidden
Gui, Main:Font, s8 c666666
Gui, Main:Add, Text, x45 y172 BackgroundTrans vSearchPlaceholder Hidden, 🔍 Search your saved texts...

; Library List
Gui, Main:Add, Progress, x30 y210 w520 h370 Background1a1a1a Disabled vLibTab4 Hidden
Gui, Main:Font, s9 norm cCCCCCC
Gui, Main:Add, ListBox, x35 y215 vSavedList w510 h360 gLoadType Background252525 c%ThemeColor% -E0x200 vLibTab5 Hidden

; Library Actions
Gui, Main:Font, s10 bold cFFFFFF
Gui, Main:Add, Progress, x560 y210 w110 h70 Background%ThemeDark% Disabled vLibTab6 Hidden
Gui, Main:Add, Text, x560 y210 w110 h70 gLoadSelectedType Center BackgroundTrans vLibTab7 Hidden, 📂 LOAD

Gui, Main:Add, Progress, x560 y290 w110 h70 Background00AA44 Disabled vLibTab8 Hidden
Gui, Main:Add, Text, x560 y290 w110 h70 gDuplicateType Center BackgroundTrans vLibTab9 Hidden, 📋 COPY

Gui, Main:Add, Progress, x560 y370 w110 h70 BackgroundCC6600 Disabled vLibTab10 Hidden
Gui, Main:Add, Text, x560 y370 w110 h70 gRenameType Center BackgroundTrans vLibTab11 Hidden, ✏️ RENAME

Gui, Main:Add, Progress, x560 y450 w110 h70 BackgroundCC0000 Disabled vLibTab12 Hidden
Gui, Main:Add, Text, x560 y450 w110 h70 gDeleteType Center BackgroundTrans vLibTab13 Hidden, 🗑️ DELETE

; Export/Import
Gui, Main:Font, s8 bold cCCCCCC
Gui, Main:Add, Button, x30 y590 w150 h30 gExportLibrary vLibTab14 Hidden, 📤 Export Library
Gui, Main:Add, Button, x190 y590 w150 h30 gImportLibrary vLibTab15 Hidden, 📥 Import Library

; =================== TAB 3: TOOLS ===================
Gui, Main:Font, s9 bold c%ThemeColor%
Gui, Main:Add, Text, x30 y135 BackgroundTrans vToolTab1 Hidden, 🔧 ADVANCED TOOLS

; Text Transformer
Gui, Main:Add, Progress, x30 y165 w310 h200 Background1a1a1a Disabled vToolTab2 Hidden
Gui, Main:Font, s9 norm cCCCCCC
Gui, Main:Add, Text, x45 y180 BackgroundTrans vToolTab3 Hidden, 🔤 Text Transformer
Gui, Main:Font, s8 norm cAAAAAA
Gui, Main:Add, Button, x45 y205 w130 h30 gToUpper vToolTab4 Hidden, UPPERCASE
Gui, Main:Add, Button, x185 y205 w130 h30 gToLower vToolTab5 Hidden, lowercase
Gui, Main:Add, Button, x45 y245 w130 h30 gToTitle vToolTab6 Hidden, Title Case
Gui, Main:Add, Button, x185 y245 w130 h30 gReverse vToolTab7 Hidden, esreveR
Gui, Main:Add, Button, x45 y285 w130 h30 gRemoveSpaces vToolTab8 Hidden, RemoveSpaces
Gui, Main:Add, Button, x185 y285 w130 h30 gAddSpaces vToolTab9 Hidden, Add Spaces
Gui, Main:Add, Button, x45 y325 w270 h30 gCountChars vToolTab10 Hidden, 📊 Count Characters

; Spam Tools
Gui, Main:Add, Progress, x360 y165 w310 h200 Background1a1a1a Disabled vToolTab11 Hidden
Gui, Main:Font, s9 norm cCCCCCC
Gui, Main:Add, Text, x375 y180 BackgroundTrans vToolTab12 Hidden, 🔁 Spam & Repeat Tools
Gui, Main:Font, s8 norm cAAAAAA
Gui, Main:Add, Text, x375 y210 BackgroundTrans vToolTab13 Hidden, Repeat Count:
Gui, Main:Add, Edit, x480 y205 vRepeatCount w60 h25 Number Center Background252525 c%ThemeColor% vToolTab14 Hidden, 5
Gui, Main:Add, Button, x375 y240 w115 h35 gRepeatText vToolTab15 Hidden, 🔁 Repeat Text
Gui, Main:Add, Button, x500 y240 w145 h35 gSpamMode vToolTab16 Hidden, ⚡ Spam Mode (F8)
Gui, Main:Add, Text, x375 y285 BackgroundTrans vToolTab17 Hidden, Spam Delay (ms):
Gui, Main:Add, Edit, x480 y280 vSpamDelay w60 h25 Number Center Background252525 c%ThemeColor% vToolTab18 Hidden, 500
Gui, Main:Add, CheckBox, x375 y315 vInfiniteSpam Background1a1a1a c%ThemeColor% vToolTab19 Hidden, Infinite Spam (Stop with ESC)

; Macro Recorder
Gui, Main:Add, Progress, x30 y380 w640 h100 Background1a1a1a Disabled vToolTab20 Hidden
Gui, Main:Font, s9 norm cCCCCCC
Gui, Main:Add, Text, x45 y395 BackgroundTrans vToolTab21 Hidden, 🎬 MACRO RECORDER
Gui, Main:Font, s8 norm cAAAAAA
Gui, Main:Add, Button, x45 y420 w150 h45 gStartRecord vToolTab22 Hidden, ⏺️ Start Recording
Gui, Main:Add, Button, x205 y420 w150 h45 gStopRecord vToolTab23 Hidden, ⏹️ Stop Recording
Gui, Main:Add, Button, x365 y420 w150 h45 gPlayMacro vToolTab24 Hidden, ▶️ Play Macro
Gui, Main:Add, Button, x525 y420 w130 h45 gClearMacro vToolTab25 Hidden, 🗑️ Clear

; Random Text Generator
Gui, Main:Add, Progress, x30 y495 w640 h85 Background1a1a1a Disabled vToolTab26 Hidden
Gui, Main:Font, s9 norm cCCCCCC
Gui, Main:Add, Text, x45 y510 BackgroundTrans vToolTab27 Hidden, 🎲 RANDOM TEXT GENERATOR
Gui, Main:Add, Button, x45 y535 w145 h35 gGenPassword vToolTab28 Hidden, 🔐 Password
Gui, Main:Add, Button, x200 y535 w145 h35 gGenLorem vToolTab29 Hidden, 📝 Lorem Ipsum
Gui, Main:Add, Button, x355 y535 w145 h35 gGenNumbers vToolTab30 Hidden, 🔢 Numbers
Gui, Main:Add, Button, x510 y535 w145 h35 gGenEmoji vToolTab31 Hidden, 😀 Emojis

; =================== TAB 4: STATS ===================
Gui, Main:Font, s9 bold c%ThemeColor%
Gui, Main:Add, Text, x30 y135 BackgroundTrans vStatTab1 Hidden, 📊 USAGE STATISTICS

; Stats Cards
Gui, Main:Add, Progress, x30 y165 w310 h140 Background1a1a1a Disabled vStatTab2 Hidden
Gui, Main:Font, s10 norm cCCCCCC
Gui, Main:Add, Text, x45 y180 BackgroundTrans vStatTab3 Hidden, ⌨️ Total Types Executed
Gui, Main:Font, s24 bold c%ThemeColor%
Gui, Main:Add, Text, x45 y210 BackgroundTrans vTotalTypesDisplay Hidden, %TotalTypes%
Gui, Main:Font, s8 norm c666666
Gui, Main:Add, Text, x45 y250 BackgroundTrans vStatTab4 Hidden, Times you've used the auto-typer

Gui, Main:Add, Progress, x360 y165 w310 h140 Background1a1a1a Disabled vStatTab5 Hidden
Gui, Main:Font, s10 norm cCCCCCC
Gui, Main:Add, Text, x375 y180 BackgroundTrans vStatTab6 Hidden, 📝 Total Characters Typed
Gui, Main:Font, s24 bold c%ThemeColor%
Gui, Main:Add, Text, x375 y210 BackgroundTrans vTotalCharsDisplay Hidden, %TotalChars%
Gui, Main:Font, s8 norm c666666
Gui, Main:Add, Text, x375 y250 BackgroundTrans vStatTab7 Hidden, Characters automatically typed

; Session Info
Gui, Main:Add, Progress, x30 y320 w640 h110 Background1a1a1a Disabled vStatTab8 Hidden
Gui, Main:Font, s10 norm cCCCCCC
Gui, Main:Add, Text, x45 y335 BackgroundTrans vStatTab9 Hidden, 💻 SESSION INFORMATION
Gui, Main:Font, s9 norm cAAAAAA
Gui, Main:Add, Text, x45 y360 BackgroundTrans vStatTab10 Hidden, Session Start: %A_Now%
Gui, Main:Add, Text, x45 y380 BackgroundTrans vComputerInfo Hidden, Computer: %A_ComputerName% • User: %A_UserName%
Gui, Main:Add, Text, x45 y400 BackgroundTrans vStatTab11 Hidden, AutoHotkey Version: %A_AhkVersion%

; Achievement System
Gui, Main:Add, Progress, x30 y445 w640 h135 Background1a1a1a Disabled vStatTab12 Hidden
Gui, Main:Font, s10 bold c%ThemeColor%
Gui, Main:Add, Text, x45 y460 BackgroundTrans vStatTab13 Hidden, 🏆 ACHIEVEMENTS UNLOCKED
Gui, Main:Font, s8 norm cCCCCCC
Gui, Main:Add, Text, x45 y485 vAchieve1 BackgroundTrans Hidden, ⭐ First Type - Use the typer once
Gui, Main:Add, Text, x45 y505 vAchieve2 BackgroundTrans Hidden, ⭐ Power User - Execute 50 types
Gui, Main:Add, Text, x45 y525 vAchieve3 BackgroundTrans Hidden, ⭐ Text Master - Type 10,000 characters
Gui, Main:Add, Text, x45 y545 vAchieve4 BackgroundTrans Hidden, ⭐ Collector - Save 10 texts
Gui, Main:Add, Text, x45 y565 vAchieve5 BackgroundTrans Hidden, ⭐ Speed Demon - Use speed under 20ms

Gui, Main:Font, s8 bold c666666
Gui, Main:Add, Button, x30 y590 w200 h30 gResetStats vStatTab14 Hidden, 🔄 Reset All Statistics

; ===== STATUS BAR =====
Gui, Main:Add, Progress, x0 y690 w700 h50 Background0a0a0a Disabled
Gui, Main:Font, s9 c%ThemeColor%
Gui, Main:Add, Text, x20 y700 vStatusBar BackgroundTrans, ● READY TO TYPE
Gui, Main:Font, s7 c444444
Gui, Main:Add, Text, x20 y720 BackgroundTrans, F9: Type • F8: Spam • Ctrl+S: Save • Ctrl+D: Delete • ESC: Stop/Exit

Gui, Main:Show, w700 h740, Roblox Auto Typer Pro
LoadTypes()
Gosub, TabTyper
CheckAchievements()
return

; ================= TAB SWITCHING =================
TabTyper:
HideAllTabs()
Loop, 28
    GuiControl, Main:Show, TyperTab%A_Index%
UpdateTabButtons("Typer")
return

TabLibrary:
HideAllTabs()
Loop, 15
    GuiControl, Main:Show, LibTab%A_Index%
UpdateTabButtons("Library")
GuiControl, Main:Focus, SearchBox
return

TabTools:
HideAllTabs()
Loop, 31
    GuiControl, Main:Show, ToolTab%A_Index%
UpdateTabButtons("Tools")
return

TabStats:
HideAllTabs()
Loop, 14
    GuiControl, Main:Show, StatTab%A_Index%
UpdateTabButtons("Stats")
CheckAchievements()
return

HideAllTabs() {
    Loop, 28
        GuiControl, Main:Hide, TyperTab%A_Index%
    Loop, 15
        GuiControl, Main:Hide, LibTab%A_Index%
    Loop, 31
        GuiControl, Main:Hide, ToolTab%A_Index%
    Loop, 14
        GuiControl, Main:Hide, StatTab%A_Index%
}

UpdateTabButtons(active) {
    global ThemeColor
    GuiControl, Main:+c666666, TabTyperBtn
    GuiControl, Main:+c666666, TabLibraryBtn
    GuiControl, Main:+c666666, TabToolsBtn
    GuiControl, Main:+c666666, TabStatsBtn
    GuiControl, Main:+c%ThemeColor%, Tab%active%Btn
}

; ================= SETTINGS GUI =================
ShowSettings:
Gui, Settings:New, +AlwaysOnTop
Gui, Settings:Color, 0f0f0f
Gui, Settings:Font, s10 bold c00D4FF
Gui, Settings:Add, Text, x20 y20, ⚙️ SETTINGS & PREFERENCES
Gui, Settings:Font, s9 norm cCCCCCC

Gui, Settings:Add, Text, x20 y50, Theme Color:
Gui, Settings:Add, DropDownList, x20 y70 w200 vThemeChoice, Blue|Red|Green|Purple
GuiControl, Settings:Choose, ThemeChoice, %Theme%

Gui, Settings:Add, CheckBox, x20 y110 vSoundEnabledSet Checked%SoundEnabled%, Enable Sound Effects
Gui, Settings:Add, CheckBox, x20 y140 vAlwaysTopSet Checked%AlwaysTop%, Always On Top

Gui, Settings:Font, s9 bold cFFFFFF
Gui, Settings:Add, Button, x20 y180 w100 gSaveSettings, 💾 Save
Gui, Settings:Add, Button, x130 y180 w100 gSettingsGuiClose, ❌ Cancel

Gui, Settings:Show, w250 h230, Settings
return

SaveSettings:
Gui, Settings:Submit
IniWrite, %SoundEnabledSet%, %SettingsFile%, Settings, SoundEnabled
IniWrite, %AlwaysTopSet%, %SettingsFile%, Settings, AlwaysTop
IniWrite, %ThemeChoice%, %SettingsFile%, Settings, Theme
MsgBox, 0, Settings Saved, Settings saved! Restart the app to apply theme changes.
Gui, Settings:Destroy
return

SettingsGuiClose:
Gui, Settings:Destroy
return

; ================= HOTKEYS =================
F9::
Gosub, TypeText
return

F8::
Gosub, SpamMode
return

^s::
Gosub, SaveType
return

^d::
Gosub, DeleteType
return

^x::
Gosub, ClearText
return

^Enter::
Gosub, TypeText
return

; ================= DRAG WINDOW =================
~LButton::
MouseGetPos,,, WinID
If (WinID = WinExist("Roblox Auto Typer Pro")) {
    PostMessage, 0xA1, 2
}
return

MinimizeGui:
Gui, Main:Minimize
return

; ================= CORE FUNCTIONS =================
SaveType:
Gui, Main:Submit, NoHide
if (UserText = "") {
    UpdateStatus("ERROR: No text to save", "CC0000")
    PlaySound(500, 200)
    return
}
InputBox, SaveName, 💾 Save Text, Enter a name for this text:,, 350, 160
if ErrorLevel
    return
if (SaveName = "") {
    UpdateStatus("ERROR: Invalid name", "CC0000")
    return
}
SaveName := RegExReplace(SaveName, "[^\w\s-]", "")
IniWrite, %UserText%, %IniFile%, Types, %SaveName%
LoadTypes()
UpdateStatus("SUCCESS: Saved as '" . SaveName . "'", "00AA44")
PlaySound(800, 100)
Sleep, 1500
UpdateStatus("● READY TO TYPE", ThemeColor)
return

LoadType:
LoadSelectedType:
Gui, Main:Submit, NoHide
if (SavedList = "") {
    UpdateStatus("WARNING: Select a text first", "FF9900")
    PlaySound(400, 150)
    return
}
IniRead, UserText, %IniFile%, Types, %SavedList%
GuiControl, Main:, UserText, %UserText%
UpdateStatus("LOADED: " . SavedList, ThemeColor)
PlaySound(1000, 100)
Gosub, TabTyper
return

DuplicateType:
Gui, Main:Submit, NoHide
if (SavedList = "") {
    UpdateStatus("WARNING: Select a text first", "FF9900")
    return
}
IniRead, Text, %IniFile%, Types, %SavedList%
NewName := SavedList . " (Copy)"
IniWrite, %Text%, %IniFile%, Types, %NewName%
LoadTypes()
UpdateStatus("COPIED: " . NewName, "00AA44")
return

DeleteType:
Gui, Main:Submit, NoHide
if (SavedList = "") {
    UpdateStatus("WARNING: Select a text to delete", "FF9900")
    PlaySound(400, 150)
    return
}
MsgBox, 4, 🗑️ Confirm Delete, Are you sure you want to delete "%SavedList%"?
IfMsgBox Yes
{
    IniDelete, %IniFile%, Types, %SavedList%
    LoadTypes()
    GuiControl, Main:, UserText,
    UpdateStatus("DELETED: " . SavedList, "CC0000")
    PlaySound(600, 150)
    Sleep, 1500
    UpdateStatus("● READY TO TYPE", ThemeColor)
}
return

RenameType:
Gui, Main:Submit, NoHide
if (SavedList = "") {
    UpdateStatus("WARNING: Select a text to rename", "FF9900")
    PlaySound(400, 150)
    return
}
IniRead, OldText, %IniFile%, Types, %SavedList%
InputBox, NewName, ✏️ Rename Text, Enter new name:,, 350, 160,,,,,, %SavedList%
if ErrorLevel
    return
if (NewName = "" || NewName = SavedList) {
    UpdateStatus("ERROR: Invalid name", "CC0000")
    return
}
NewName := RegExReplace(NewName, "[^\w\s-]", "")
IniWrite, %OldText%, %IniFile%, Types, %NewName%
IniDelete, %IniFile%, Types, %SavedList%
LoadTypes()
UpdateStatus("RENAMED: " . NewName, ThemeColor)
PlaySound(900, 100)
return

ClearText:
GuiControl, Main:, UserText,
UpdateStatus("TEXT CLEARED", "FF9900")
PlaySound(600, 100)
return

TypeText:
Gui, Main:Submit, NoHide
if (UserText = "") {
    UpdateStatus("ERROR: No text to type", "CC0000")
    PlaySound(500, 200)
    return
}
if (Delay = "" || Delay < 1)
    Delay := 3
if (TypeSpeed = "" || TypeSpeed < 10)
    TypeSpeed := 50

Gui, Main:Minimize
UpdateStatus("PREPARING TO TYPE...", "FF9900")

Loop, %Delay%
{
    remaining := Delay - A_Index + 1
    UpdateStatus("TYPING IN " . remaining . " SECONDS...", "FF9900")
    ToolTip, ⚡ AUTO-TYPING IN %remaining% SECONDS...`n`n🎯 Position your cursor now!
    PlaySound(800 + (remaining * 100), 50)
    Sleep, 1000
}
ToolTip

if (PasteMode = 1) {
    Clipboard := UserText
    SendInput, ^v
} else {
    if (Randomize = 1) {
        Loop, Parse, UserText
        {
            SendInput, %A_LoopField%
            Random, RandDelay, TypeSpeed - 20, TypeSpeed + 20
            Sleep, RandDelay
        }
    } else {
        Loop, Parse, UserText
        {
            SendInput, %A_LoopField%
            Sleep, TypeSpeed
        }
    }
}

if (EnterAfter = 1)
    SendInput, {Enter}

; Update Stats
TotalTypes++
TotalChars += StrLen(UserText)
IniWrite, %TotalTypes%, %SettingsFile%, Stats, TotalTypes
IniWrite, %TotalChars%, %SettingsFile%, Stats, TotalChars
GuiControl, Main:, TotalTypesDisplay, %TotalTypes%
GuiControl, Main:, TotalCharsDisplay, %TotalChars%

PlaySound(1200, 100)
Gui, Main:Restore
UpdateStatus("SUCCESS: Text typed!", "00AA44")
CheckAchievements()
Sleep, 2000
UpdateStatus("● READY TO TYPE", ThemeColor)
return

SpamMode:
Gui, Main:Submit, NoHide
if (UserText = "") {
    UpdateStatus("ERROR: No text to spam", "CC0000")
    return
}
if (SpamDelay = "")
    SpamDelay := 500

UpdateStatus("SPAM MODE ACTIVE - Press ESC to stop", "FF3366")
Gui, Main:Minimize

if (InfiniteSpam = 1) {
    Loop {
        SendInput, %UserText%{Enter}
        Sleep, SpamDelay
        if GetKeyState("Esc", "P")
            break
    }
} else {
    Loop, %RepeatCount%
    {
        SendInput, %UserText%{Enter}
        Sleep, SpamDelay
        if GetKeyState("Esc", "P")
            break
    }
}

Gui, Main:Restore
UpdateStatus("SPAM STOPPED", "00AA44")
return

; ================= TEXT TOOLS =================
ToUpper:
Gui, Main:Submit, NoHide
StringUpper, UserText, UserText
GuiControl, Main:, UserText, %UserText%
UpdateStatus("Converted to UPPERCASE", ThemeColor)
return

ToLower:
Gui, Main:Submit, NoHide
StringLower, UserText, UserText
GuiControl, Main:, UserText, %UserText%
UpdateStatus("Converted to lowercase", ThemeColor)
return

ToTitle:
Gui, Main:Submit, NoHide
StringLower, UserText, UserText, T
GuiControl, Main:, UserText, %UserText%
UpdateStatus("Converted to Title Case", ThemeColor)
return

Reverse:
Gui, Main:Submit, NoHide
Reversed := ""
Loop, Parse, UserText
    Reversed := A_LoopField . Reversed
GuiControl, Main:, UserText, %Reversed%
UpdateStatus("Text Reversed", ThemeColor)
return

RemoveSpaces:
Gui, Main:Submit, NoHide
StringReplace, UserText, UserText, %A_Space%,, All
GuiControl, Main:, UserText, %UserText%
UpdateStatus("Spaces Removed", ThemeColor)
return

AddSpaces:
Gui, Main:Submit, NoHide
Spaced := ""
Loop, Parse, UserText
    Spaced .= A_LoopField . " "
GuiControl, Main:, UserText, %Spaced%
UpdateStatus("Spaces Added", ThemeColor)
return

CountChars:
Gui, Main:Submit, NoHide
CharCount := StrLen(UserText)
WordCount := 0
Loop, Parse, UserText, %A_Space%
    WordCount++
MsgBox, 0, 📊 Text Statistics, Characters: %CharCount%`nWords: %WordCount%`nLines: 1
return

RepeatText:
Gui, Main:Submit, NoHide
if (RepeatCount = "")
    RepeatCount := 5
Original := UserText
UserText := ""
Loop, %RepeatCount%
    UserText .= Original . "`n"
GuiControl, Main:, UserText, %UserText%
UpdateStatus("Text Repeated " . RepeatCount . " times", ThemeColor)
return

; ================= GENERATORS =================
GenPassword:
Length := 16
Password := ""
Loop, %Length%
{
    Random, Type, 1, 4
    if (Type = 1)
        Random, Char, 65, 90  ; A-Z
    else if (Type = 2)
        Random, Char, 97, 122  ; a-z
    else if (Type = 3)
        Random, Char, 48, 57  ; 0-9
    else
        Random, Char, 33, 47  ; Symbols
    Password .= Chr(Char)
}
GuiControl, Main:, UserText, %Password%
UpdateStatus("Random Password Generated", ThemeColor)
return

GenLorem:
Lorem := "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
GuiControl, Main:, UserText, %Lorem%
UpdateStatus("Lorem Ipsum Generated", ThemeColor)
return

GenNumbers:
Numbers := ""
Loop, 20
{
    Random, Num, 0, 9
    Numbers .= Num
}
GuiControl, Main:, UserText, %Numbers%
UpdateStatus("Random Numbers Generated", ThemeColor)
return

GenEmoji:
Emojis := "😀😁😂🤣😃😄😅😆😉😊😋😎😍😘🥰😗😙😚☺️🙂🤗🤩🤔🤨😐😑😶🙄😏😣😥😮🤐😯😪😫🥱😴"
Result := ""
Loop, 10
{
    Random, Pos, 1, StrLen(Emojis)
    Result .= SubStr(Emojis, Pos, 1)
}
GuiControl, Main:, UserText, %Result%
UpdateStatus("Random Emojis Generated", ThemeColor)
return

; ================= TEMPLATES =================
Template1:
GuiControl, Main:, UserText, Hey! How are you doing? Hope you're having an amazing day! 😊
Gosub, TabTyper
return

Template2:
GuiControl, Main:, UserText, Dear Sir/Madam,`n`nI hope this message finds you well. I am writing to...`n`nBest regards
Gosub, TabTyper
return

Template3:
GuiControl, Main:, UserText, GG! That was an epic game! Want to team up for the next match? 🎮
Gosub, TabTyper
return

Template4:
GuiControl, Main:, UserText, %Clipboard%
UpdateStatus("Clipboard pasted to text box", ThemeColor)
Gosub, TabTyper
return

; ================= LIBRARY FUNCTIONS =================
SearchLibrary:
Gui, Main:Submit, NoHide
if (SearchBox != "") {
    GuiControl, Main:Hide, SearchPlaceholder
    ; Filter list based on search
} else {
    GuiControl, Main:Show, SearchPlaceholder
}
return

ExportLibrary:
IniRead, Data, %IniFile%, Types
FileSelectFile, ExportFile, S16, export.txt, Export Library, Text Files (*.txt)
if (ExportFile != "") {
    FileDelete, %ExportFile%
    FileAppend, %Data%, %ExportFile%
    UpdateStatus("Library exported successfully", "00AA44")
}
return

ImportLibrary:
FileSelectFile, ImportFile, 3, , Import Library, Text Files (*.txt)
if (ImportFile != "") {
    FileRead, Data, %ImportFile%
    Loop, Parse, Data, `n
    {
        StringSplit, pair, A_LoopField, =
        if (pair1 != "" && pair2 != "")
            IniWrite, %pair2%, %IniFile%, Types, %pair1%
    }
    LoadTypes()
    UpdateStatus("Library imported successfully", "00AA44")
}
return

LoadTypes() {
    global IniFile, ThemeColor
    GuiControl, Main:, SavedList, |
    IniRead, Data, %IniFile%, Types
    if (Data = "ERROR") {
        GuiControl, Main:, LibCount, 0 items
        return
    }
    
    Count := 0
    Loop, Parse, Data, `n
    {
        StringSplit, pair, A_LoopField, =
        if (pair1 != "" && pair1 != "ERROR") {
            GuiControl, Main:, SavedList, %pair1%
            Count++
        }
    }
    GuiControl, Main:, LibCount, %Count% items
}

; ================= STATS & ACHIEVEMENTS =================
CheckAchievements() {
    global TotalTypes, TotalChars, ThemeColor
    
    if (TotalTypes >= 1)
        GuiControl, Main:+c%ThemeColor%, Achieve1
    if (TotalTypes >= 50)
        GuiControl, Main:+c%ThemeColor%, Achieve2
    if (TotalChars >= 10000)
        GuiControl, Main:+c%ThemeColor%, Achieve3
        
    IniRead, Data, %IniFile%, Types
    Count := 0
    Loop, Parse, Data, `n
        Count++
    if (Count >= 10)
        GuiControl, Main:+c%ThemeColor%, Achieve4
        
    if (TypeSpeed <= 20)
        GuiControl, Main:+c%ThemeColor%, Achieve5
}

ResetStats:
MsgBox, 4, Reset Statistics, Are you sure you want to reset all statistics?
IfMsgBox Yes
{
    IniWrite, 0, %SettingsFile%, Stats, TotalTypes
    IniWrite, 0, %SettingsFile%, Stats, TotalChars
    TotalTypes := 0
    TotalChars := 0
    GuiControl, Main:, TotalTypesDisplay, 0
    GuiControl, Main:, TotalCharsDisplay, 0
    UpdateStatus("Statistics Reset", "FF9900")
}
return

; ================= MACRO SYSTEM =================
global Recording := false
global MacroKeys := ""

StartRecord:
Recording := true
MacroKeys := ""
UpdateStatus("RECORDING MACRO... (Press Stop to finish)", "FF3366")
Input, MacroKeys, L0 T30
return

StopRecord:
Recording := false
UpdateStatus("Macro recorded: " . StrLen(MacroKeys) . " keys", "00AA44")
return

PlayMacro:
if (MacroKeys = "") {
    UpdateStatus("ERROR: No macro recorded", "CC0000")
    return
}
SendInput, %MacroKeys%
UpdateStatus("Macro played", ThemeColor)
return

ClearMacro:
MacroKeys := ""
UpdateStatus("Macro cleared", "FF9900")
return

; ================= UTILITY FUNCTIONS =================
UpdateStatus(msg, color := "00D4FF") {
    GuiControl, Main:+c%color%, StatusBar
    GuiControl, Main:, StatusBar, ● %msg%
}

PlaySound(freq, duration) {
    global SoundEnabled
    if (SoundEnabled = 1)
        SoundBeep, %freq%, %duration%
}

GuiClose:
MainGuiClose:
ExitApp