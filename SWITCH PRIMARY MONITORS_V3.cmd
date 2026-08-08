:: multimonitor switch , which will write check file to root of this folder. cannot be used on locked usb drives that have no permission to write.
@echo off
cd /d "%~dp0"

:: Saves the tracker file in the exact same folder as this script
set "TrackerFile=%~dp0screen_toggle_flag.dat"

:: If the tracker file exists, switch to Monitor 2 and delete the tracker
if exist "%TrackerFile%" (
    MultiMonitorTool.exe /SetPrimary \\.\DISPLAY2
    del "%TrackerFile%" >nul 2>&1
) else (
    :: If the tracker file does NOT exist, switch to Monitor 1 and create the tracker
    MultiMonitorTool.exe /SetPrimary \\.\DISPLAY1
    echo 1 > "%TrackerFile%"
)
