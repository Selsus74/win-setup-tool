# Imports
Add-Type -AssemblyName System.Windows.Forms

Import-Module Microsoft.WinGet.Client

# Funktion um auf vorhandene Officeinstallation zuprüfen
function Test-OfficeInstallation {
    $InstalledPackages = Get-WinGetPackage -Name "Microsoft 365" | Select-Object -ExpandProperty Name
    
    if($InstalledPackages.Count -gt 0) {
        $script:OfficeIsInstalled = $true
    }
    else {
        $script:OfficeIsInstalled = $false
    }
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
    [System.Windows.Forms.MessageBox]::Show("Es wurden installierte Officeprodukte gefunden. Diese werden jetzt entfernt.","Suche abgeschlossen",0,[System.Windows.Forms.MessageBoxIcon]::Information)

    foreach ($InstalledPackage in $InstalledPackages) {
        Uninstall-WinGetPackage -Name $InstalledPackage
    }

    Copy-Item "$env:HOMEDRIVE\Temp\launch_office_uninstall.cmd" -Destination "$env:HOMEDRIVE\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp"
}

exit