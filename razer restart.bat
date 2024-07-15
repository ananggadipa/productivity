@echo off
setlocal enabledelayedexpansion

echo Closing Razer Synapse processes...

:: List all processes and filter those starting with 'Razer' or 'Rz'
for /f "tokens=1,2 delims=," %%a in ('tasklist /fo csv /nh ^| findstr /i "Razer Rz"') do (
    :: Extract process name and PID
    set processName=%%~a
    set processPID=%%~b
    
    :: Remove quotes from the PID
    set processPID=!processPID:"=!
    
    :: Terminate the process
    taskkill /PID !processPID! /F >nul 2>&1
    
    :: Check if the termination was successful
    if !errorlevel! equ 0 (
        echo SUCCESS: Terminated !processName! with PID !processPID!
    ) else (
        echo ERROR: Failed to terminate !processName! with PID !processPID!
    )
)

echo Done. Waiting for 3 seconds...
timeout /t 3

echo Starting Razer Synapse...
start "" "C:\Program Files (x86)\Razer\Synapse3\WPFUI\Framework\Razer Synapse 3 Host\Razer Synapse 3.exe"

pause

:: echo Done. Closing in 3 seconds..

:: timeout /t 3 
:: exit
