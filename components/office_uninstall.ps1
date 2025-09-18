# Imports
Add-Type -AssemblyName System.Windows.Forms
# Funktion um auf vorhandene Officeinstallation zuprüfen
function Test-OfficeInstallation {
    $InstalledPackages = Get-Package -Name "Microsoft 365*" | Select-Object -ExpandProperty Name
    
    if($InstalledPackages.Count -ge 1) {
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

    foreach ($InstalledPackage in $InstalledPackages) {
        winget uninstall $InstalledPackage --silent
    }
}

# Uninstall wird auf Erfolg getestet
Test-OfficeInstallation

if(-NOT ($OfficeIsInstalled)) {
    [System.Windows.Forms.MessageBox]::Show("Die Office-Produkte wurden erfolgreich deinstalliert.","Suche abgeschlossen",0,[System.Windows.Forms.MessageBoxIcon]::Information)

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