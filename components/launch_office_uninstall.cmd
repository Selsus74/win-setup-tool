powershell -EP Bypass -NoP -Command "&{ Start-Process powershell -ArgumentList '-ExecutionPolicy Bypass -NoProfile -File C:\Temp\office_uninstall_part2.ps1' -Verb RunAs}"

exit