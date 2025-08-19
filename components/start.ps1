#Get current user for temp cleaning
$env:USERPROFILE > $env:HOMEDRIVE\Temp\currentuser.info

#Start the Main-Script
#Starten des Hauptskriptes
Start-Process -Verb RunAs powershell.exe '-ExecutionPolicy Bypass -File ""C:\Temp\config_tool_main.ps1""'

exit