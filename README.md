# win-setup-tool
My Powershell/Batch Tool for first Setup of a Windows System

PC-Grundeinrichtung mittels PowerShell-Skript -> Kompiliert als .exe-Datei

Features:
1.) Benutzereinstellungen
1.1 Neuen Nutzer anlegen, benennen, Passwort setzen und/oder zu den Administratoren hinzufügen.
1.2 Lokalen Administrator aktivieren und Passwort setzten.

2.) Energieoptionen
2.1 Energiesparplan wählen (Ausbalanciert, Höchstleistung etc.)
2.2 Desktop- oder Notebookmodus wählen (Optimierung für den Akkubetrieb)

3.) Downloads
3.1 TeamViewer-Host oder TeamViewer-Full-Client downloaden.
3.2 Ninite-Installer mit auswählbarer Software erstellen.

4.) Microsoft-Optionen
4.1 Vorinstallierte Microsoft Office Produkte entfernen.
4.2 Outlook New vollständig deinstallieren.
4.3 Windows-Debloat durchführen (entfernt einige Microsoft Produkte, deaktiviert Telemetrie, uvm.) | Für alle Infos -> https://github.com/Raphire/Win11Debloat
4.4 Windows AI-Features entfernen | Für alle Infos -> https://github.com/zoicware/RemoveWindowsAI
4.5 Registrieren einer neuen Aufgabe in der Windows-Aufgabenplanung um die Umstellung auf Outlook New per PowerShell-Skript zu verhindern.


Das Tool läuft nach dem Einstellungen getroffen (weitestgehend) selbstständig. Währenddessen sollte das Gerät nicht genutzt werden.
Die Office Deinstallation muss mit Nutzereingaben bestätigt werden.
Wenn das Tool fertig ist (also nachdem neu gestartet wurde) gibt es eine Meldung.
