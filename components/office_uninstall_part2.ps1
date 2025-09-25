# Imports
Add-Type -AssemblyName System.Windows.Forms

Import-Module Microsoft.WinGet.Client

# Funktion um auf vorhandene Officeinstallation zuprüfen
function Test-OfficeInstallation {
    $script:InstalledPackages = Get-WinGetPackage -Name "Microsoft 365" | Select-Object -ExpandProperty Name
    
    if($InstalledPackages.Count -gt 0) {
        $script:OfficeIsInstalled = $true
    }
    else {
        $script:OfficeIsInstalled = $false
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
    [System.Windows.Forms.MessageBox]::Show("Bei der Deinstallation sind Fehler aufgetreten, bitte deinstallieren Sie die folgenden Pakete manuell.","Suche abgeschlossen",0,[System.Windows.Forms.MessageBoxIcon]::Error)

    # Autostart Cleanup wird gestartet
    Remove-Item "$env:HOMEDRIVE\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\launch_office_uninstall.cmd" -Force

    Start-Process -Verb RunAs "$env:HOMEDRIVE\Temp\autostarter.cmd"

    exit
}