powershell -EP Bypass -NoP -Command "&{ Start-Process powershell -ArgumentList '-ExecutionPolicy Bypass -NoProfile -File C:\Temp\office_uninstall.ps1' -Verb RunAs}"

exit