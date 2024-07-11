@echo off
echo Closing Razer Synapse...
taskkill /F /IM "Razer Synapse 3.exe"

echo Waiting for 3 seconds...
timeout /t 3

echo Starting Razer Synapse...
start "" "C:\Program Files (x86)\Razer\Synapse3\WPFUI\Framework\Razer Synapse 3 Host\Razer Synapse 3.exe"

echo Done. Closing in 3 seconds..

timeout /t 3
exit
