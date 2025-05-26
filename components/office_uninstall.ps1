# Imports
Add-Type -AssemblyName System.Windows.Forms
# Funktion um auf vorhandene Officeinstallation zuprüfen
function Test-OfficeInstallation {
    $InstalledPackages = winget list --accept-source-agreements

    if($InstalledPackages -match "O365") {
        $script:OfficeIsInstalled = $true
    }
    elseif ($InstalledPackages -match "office") {
        $script:OfficeIsInstalled = $true
    }
    else {
        $script:OfficeIsInstalled = $false
    }
}

# Rebootfunktion
function Restart-Host {
    shutdown.exe -r -t 5
}
# Prüfung auf installierte Officeprodukte wird ausgeführt
Test-OfficeInstallation

# Wenn Office nicht installiert
if(-NOT ($OfficeIsInstalled)) {
    [System.Windows.Forms.MessageBox]::Show("Es wurde kein installiertes Officeprodukt gefunden.","Suche abgeschlossen",0,[System.Windows.Forms.MessageBoxIcon]::Information)

    Start-Process -Verb RunAs "$env:HOMEDRIVE\Temp\autostarter.cmd"

    exit
}
# Wenn Office installiert
else {
    [System.Windows.Forms.MessageBox]::Show("Es wurden installierte Officeprodukt gefunden. Diese werden jetzt entfernt.","Suche abgeschlossen",0,[System.Windows.Forms.MessageBoxIcon]::Information)

    winget uninstall "office" --force --silent
    winget uninstall "Microsoft 365 (Office)" --force --silent
    winget uninstall "Microsoft 365 - de-de" --force --silent
    winget uninstall "Microsoft 365 - en-gb" --force --silent
    winget uninstall "Microsoft 365 - fr-fr" --force --silent
    winget uninstall "Microsoft 365 - nl-nl" --force --silent
    winget uninstall "Microsoft 365 - pl-pl" --force --silent
}

# Uninstall wird auf Erfolg getestet
Test-OfficeInstallation

if(-NOT ($OfficeIsInstalled)) {
    [System.Windows.Forms.MessageBox]::Show("Die Office-Produkte wurden erfolgreich deinstalliert. Das System startet jetzt neu!","Suche abgeschlossen",0,[System.Windows.Forms.MessageBoxIcon]::Information)

    # Autostart Cleanup wird gestartet
    Remove-Item "$env:HOMEDRIVE\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\launch_office_uninstall.cmd" -Force

    Start-Process -Verb RunAs "$env:HOMEDRIVE\Temp\autostarter.cmd"

    exit
}
else {
    [System.Windows.Forms.MessageBox]::Show("Um die Deinstallation abzuschließen muss das System neugestartet werden.","Suche abgeschlossen",0,[System.Windows.Forms.MessageBoxIcon]::Information)

    Copy-Item "$env:HOMEDRIVE\Temp\launch_office_uninstall.cmd" -Destination "$env:HOMEDRIVE\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp"

    Restart-Host
}

exit