::Startet die Installer sofern vorhanden
if exist "%HOMEDRIVE%\Tools\NiniteInstaller.exe" (
	start "" "%HOMEDRIVE%\Tools\NiniteInstaller.exe"
)

if exist "%HOMEDRIVE%\Tools\TeamViewer_Full.exe" (
	start "" "%HOMEDRIVE%\Tools\TeamViewer_Full.exe"
)

if exist "%HOMEDRIVE%\Tools\TeamViewer_Host.exe" (
	start "" "%HOMEDRIVE%\Tools\TeamViewer_Host.exe"
)

::Startet die delete.ps1 und bereinigt C:Temp sowie den Autostart-Ordner
powershell -EP Bypass -NoP -Command "&{ Start-Process powershell -ArgumentList '-ExecutionPolicy Bypass -NoProfile -File C:\Temp\delete.ps1' -Verb RunAs}"

exit