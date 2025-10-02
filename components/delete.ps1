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
$InitalUser = Get-Content "$env:HOMEDRIVE\Temp\currentuser.info"
Remove-Item -Path "$InitalUser\AppData\Local\Temp\ConfigTool" -Recurse -Force

# Info über Abschluss
[System.Windows.Forms.MessageBox]::Show("Das ConfigTool hat die Einrichtung abgeschlossen","Fertig",0,[System.Windows.Forms.MessageBoxIcon]::Information)


# Löscht den Tempordner unter C:
# Delete new temporary folder and close obsolete powershell sessions(fixes a problem with ps windows after programm exit)
Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"cd c:\ & rmdir C:\Temp /s /q & taskkill /f /im powershell.exe`""

exit