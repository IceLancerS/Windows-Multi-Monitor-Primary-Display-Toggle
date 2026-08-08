# Windows Multi-Monitor Primary Display Toggle

A lightweight, automated batch script to seamlessly toggle the primary (main) display back and forth on multi-monitor setups (2 or 3+ screens) without using the Windows Settings UI.

## Prerequisites
1. Download **MultiMonitorTool** from the official NirSoft website.
2. Place `MultiMonitorTool.exe` in the same directory as these scripts.

## How it Works
The script utilizes a state tracking flag file (`screen_toggle_flag.dat`). 
- If the file exists, it forces the primary display to `\\.\DISPLAY2` and removes the flag.
- If the file does not exist, it resets the primary display to `\\.\DISPLAY1` and creates the flag.

## Available Versions

* **`SWITCH PRIMARY MONITORS.cmd`**
  * A simple script to switch if a user has only 2 monitors. This uses native loops to switch straight between the two displays.
* **`SWITCH PRIMARY MONITORS_V2.cmd`**
  * A multi-monitor switch that uses the Windows standard `Temp` folder to write the tracking file. 
  * *Note: Susceptible to deletion by automated system tools like CCleaner or Storage Sense.*
* **`SWITCH PRIMARY MONITORS_V3.cmd`**
  * A multi-monitor switch that writes the tracking `.dat` file directly to the root of the script folder to prevent accidental cleanups.
  * *Note: Cannot be used on locked USB drives or restricted folders that do not grant write permissions.*

## How to Customize (For 3+ Monitors)
If your computer assigns a different ID to your secondary monitors (for example, if your second monitor is registered as `DISPLAY3` instead of `DISPLAY2`), the script is completely editable. 

1. Right-click the `.cmd` file and select **Edit** (or open it in Notepad).
2. Look for the `\\.\DISPLAY2` string inside the code.
3. Replace it with your specific monitor path (e.g., `\\.\DISPLAY3`) as shown inside the MultiMonitorTool visual user interface.
4. Save the file and run it.
