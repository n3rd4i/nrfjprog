#NoEnv
#NoTrayIcon
#Warn
SendMode Input
SetTitleMatchMode, 2
SetControlDelay 0
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

WinWait,nRF-Command-Line-Tools_10_2_1 ahk_class WixStdBA ahk_exe nRF-Command-Line-Tools_10_2_1_Installer_64.exe,,180
ControlClick,Button2,nRF-Command-Line-Tools_10_2_1 ahk_class WixStdBA ahk_exe nRF-Command-Line-Tools_10_2_1_Installer_64.exe
ControlClick,Button4,nRF-Command-Line-Tools_10_2_1 ahk_class WixStdBA ahk_exe nRF-Command-Line-Tools_10_2_1_Installer_64.exe

WinWait,nRF-Command-Line-Tools_10_2_1 ahk_class MsiDialogCloseClass ahk_exe nRF-Command-Line-Tools_10_2_1_Installer_64.exe,,180
ControlClick,Button1,nRF-Command-Line-Tools_10_2_1 ahk_class MsiDialogCloseClass ahk_exe nRF-Command-Line-Tools_10_2_1_Installer_64.exe
ControlClick,Button4,nRF-Command-Line-Tools_10_2_1 ahk_class MsiDialogCloseClass ahk_exe nRF-Command-Line-Tools_10_2_1_Installer_64.exe

sleep 3000

WinWait,nRF-Command-Line-Tools_10_2_1 ahk_class MsiDialogCloseClass ahk_exe nRF-Command-Line-Tools_10_2_1_Installer_64.exe,,180
ControlClick,Button1,nRF-Command-Line-Tools_10_2_1 ahk_class MsiDialogCloseClass ahk_exe nRF-Command-Line-Tools_10_2_1_Installer_64.exe

sleep 2000

WinWait,nRF-Command-Line-Tools_10_2_1 ahk_class WixStdBA ahk_exe nRF-Command-Line-Tools_10_2_1_Installer_64.exe,,180
ControlClick,Button19,nRF-Command-Line-Tools_10_2_1 ahk_class WixStdBA ahk_exe nRF-Command-Line-Tools_10_2_1_Installer_64.exe
