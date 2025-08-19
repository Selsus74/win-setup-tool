::Startet das auto execute Installer script
start powershell.exe -Command "Start-Process powershell.exe '-NoExit -ExecutionPolicy Bypass -File ""C:\Temp\autoexecute.ps1""'"

::Startet die delete.ps1 und bereinigt C:Temp sowie den Autostart-Ordner
powershell -EP Bypass -NoP -Command "&{ Start-Process powershell -ArgumentList '-ExecutionPolicy Bypass -NoProfile -File C:\Temp\delete.ps1' -Verb RunAs}"

exit