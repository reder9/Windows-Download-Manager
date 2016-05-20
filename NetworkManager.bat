rem Caleb Reder's Batch Script for limiting
rem Windows 10 to download updates only at 
rem specific times.

@echo off
cls

:start

  rem See if time is between 2 AM and 6 AM (change these times as needed)
  rem If so then set mode to night else set to day
  
  if %TIME:~0,2% geq 02 if %TIME:~0,2% lss 06 ( goto night ) 
  goto :day
   
:day
netsh wlan set profileparameter name="YOUR_NETWORK_HERE" cost=fixed
echo Wifi set to 'Metered Connection'
TIMEOUT 600
goto start

:night
netsh wlan set profileparameter name="YOUR_NETWORK_HERE" cost=unrestricted
echo Wifi set to 'Non-Metered Connection'
TIMEOUT 600
goto start