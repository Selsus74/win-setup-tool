#Get User
$InitialUser = Get-Content "$env:HOMEDRIVE\Temp\currentuser.info"

if (Test-Path "$InitialUser\Downloads\NiniteInstaller.exe") {
	Start-Process "$InitialUser\Downloads\NiniteInstaller.exe"
}
if (Test-Path "$InitialUser\Downloads\TeamViewer_Full.exe") {
	Start-Process "$InitialUser\Downloads\TeamViewer_Full.exe"
}
if (Test-Path "$InitialUser\Downloads\TeamViewer_Host.exe") {
	Start-Process "$InitialUser\Downloads\TeamViewer_Host.exe"
}

exit