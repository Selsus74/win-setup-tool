::Initialisieren des Tools
::Erstellen eines universellen Tempordners unter C: - kein Benutzerkontext
::new temporary directory without user-context
mkdir %Homedrive%\Temp\
timeout -t 5
::Alle benötigten Komponenten werden in das neue Tempverzeichnis kopiert
::Copy files to new temporary archive
copy "%Temp%\Configtool\release\*" "%Homedrive%\Temp\"
timeout -t 5
::Intialisierung abgeschlossen - Ausführen des Starterskripts im neues Tempordner
::Initialization complete - Execute Startingscript within new Tempdirectory
start powershell.exe -Command "Start-Process powershell.exe '-NoExit -ExecutionPolicy Bypass -File ""C:\Temp\start.ps1""'"

exit