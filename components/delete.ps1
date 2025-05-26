# Cleanup Script
# Imports
Add-Type -AssemblyName System.Windows.Forms

# Löscht die autorun.cmd im Startup-Ordner
# Check ob die Datei im Startupordner vorhanden ist
$StartupFolder = Get-ChildItem "$env:HOMEDRIVE\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\"

if ($StartupFolder -contains "autostarter.cmd")
{
    Remove-Item -Path "$env:HOMEDRIVE\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\autostarter.cmd" -Force
}

# Löscht den Benutzerspezifischen Tempordner anhand zuvor gespeicherter Nutzer Daten
$CurrentUserTemp = Get-Content "$env:HOMEDRIVE\Temp\currenttemp.info"
Remove-Item -Path "$CurrentUserTemp\ConfigTool\" -Recurse -Force

# Info über Abschluss
[System.Windows.Forms.MessageBox]::Show("Das ConfigTool hat die Einrichtung abgeschlossen","Fertig",0,[System.Windows.Forms.MessageBoxIcon]::Information)


# Löscht den Tempordner unter C:
# Delete new temporary folder
Start-Process cmd.exe -Argumentlist '/c rd /s /q %homedrive%\Temp'

exit