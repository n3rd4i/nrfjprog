#NoEnv
#NoTrayIcon
#Warn
SendMode Input
SetTitleMatchMode, 2
SetControlDelay 0
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

WinWait,nRF-Command-Line-Tools_10_2_1 ahk_class WixStdBA ahk_exe nRF-Command-Line-Tools_10_2_1_Installer_64.exe,,180
ControlSend,Button2,{SPACE},nRF-Command-Line-Tools_10_2_1 ahk_class WixStdBA ahk_exe nRF-Command-Line-Tools_10_2_1_Installer_64.exe
ControlSend,Button4,{SPACE},nRF-Command-Line-Tools_10_2_1 ahk_class WixStdBA ahk_exe nRF-Command-Line-Tools_10_2_1_Installer_64.exe

; Installing SEGGER driver
WinWait,SEGGER ahk_class #32770 ahk_exe JLink_Windows_V644e.exe,,180
ControlSend,Button2,{SPACE},SEGGER ahk_class #32770 ahk_exe JLink_Windows_V644e.exe
ControlSend,Button2,{SPACE},SEGGER ahk_class #32770 ahk_exe JLink_Windows_V644e.exe
ControlSend,Button2,{SPACE},SEGGER ahk_class #32770 ahk_exe JLink_Windows_V644e.exe
ControlSend,Button2,{SPACE},SEGGER ahk_class #32770 ahk_exe JLink_Windows_V644e.exe

; pending on pop-up segger window (does this exists always?)
WinWait,SEGGER ahk_class #32770 ahk_exe JLinkDLLUpdater.exe,,180
ControlSend,Button1,{SPACE},SEGGER ahk_class #32770 ahk_exe JLinkDLLUpdater.exe

; Continuing installation
WinWait,SEGGER ahk_class #32770 ahk_exe JLink_Windows_V644e.exe,,180
ControlSend,Button1,{SPACE},SEGGER ahk_class #32770 ahk_exe JLink_Windows_V644e.exe
ControlSend,Button2,{SPACE},SEGGER ahk_class #32770 ahk_exe JLink_Windows_V644e.exe

; Continue with the installer
WinWait,nRF-Command-Line-Tools_10_2_1 ahk_class MsiDialogCloseClass ahk_exe nRF-Command-Line-Tools_10_2_1_Installer_64.exe,,180
ControlSend,Button1,{SPACE},nRF-Command-Line-Tools_10_2_1 ahk_class MsiDialogCloseClass ahk_exe nRF-Command-Line-Tools_10_2_1_Installer_64.exe
ControlSend,Button4,{SPACE},nRF-Command-Line-Tools_10_2_1 ahk_class MsiDialogCloseClass ahk_exe nRF-Command-Line-Tools_10_2_1_Installer_64.exe

WinWait,nRF-Command-Line-Tools_10_2_1 ahk_class MsiDialogCloseClass ahk_exe nRF-Command-Line-Tools_10_2_1_Installer_64.exe,,180
while WinExist("ahk_class MsiDialogCloseClass")
{
	ControlSend,Button1,{SPACE},nRF-Command-Line-Tools_10_2_1 ahk_class MsiDialogCloseClass ahk_exe nRF-Command-Line-Tools_10_2_1_Installer_64.exe
	Sleep, 200
}

WinWait,nRF-Command-Line-Tools_10_2_1 ahk_class WixStdBA ahk_exe nRF-Command-Line-Tools_10_2_1_Installer_64.exe,,180
while WinExist("ahk_class WixStdBA")
{
	ControlSend,Button19,{SPACE},nRF-Command-Line-Tools_10_2_1 ahk_class WixStdBA ahk_exe nRF-Command-Line-Tools_10_2_1_Installer_64.exe
	Sleep, 200
}
