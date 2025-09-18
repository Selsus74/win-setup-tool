::Closes all other PowerShell instances (hard fix for clean up problems lol)
taskkill /f /t /im powershell.exe

::Startet das auto execute Installer script
powershell -EP Bypass -NoP -Command "&{ Start-Process powershell -ArgumentList '-ExecutionPolicy Bypass -NoProfile -File C:\Temp\autoexecute.ps1' -Verb RunAs}"

::Startet die delete.ps1 und bereinigt C:Temp sowie den Autostart-Ordner
powershell -EP Bypass -NoP -Command "&{ Start-Process powershell -ArgumentList '-ExecutionPolicy Bypass -NoProfile -File C:\Temp\delete.ps1' -Verb RunAs}"

exit