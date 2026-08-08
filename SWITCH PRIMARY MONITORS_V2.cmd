:: multimonitor switch using windows temp folder to write check file. Susceptible to deletion by ccleaner and such.
@echo off
cd /d "%~dp0"

:: Set the path for a tiny tracker file
set "TrackerFile=%temp%\screen_toggle_flag.txt"

:: If the tracker file exists, switch to Monitor 2 and delete the tracker
if exist "%TrackerFile%" (
    MultiMonitorTool.exe /SetPrimary \\.\DISPLAY2
    del "%TrackerFile%" >nul 2>&1
) else (
    :: If the tracker file does NOT exist, switch to Monitor 1 and create the tracker
    MultiMonitorTool.exe /SetPrimary \\.\DISPLAY1
    echo 1 > "%TrackerFile%"
)
