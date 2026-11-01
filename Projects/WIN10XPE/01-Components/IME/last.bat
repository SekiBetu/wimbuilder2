if %VER[3]% LEQ 18300 goto :EOF
binmay.exe -u "%X_SYS%\InputService.dll" -s u:MiniNT -r u:NiniNT
fc /b "%X_SYS%\InputService.dll.org" "%X_SYS%\InputService.dll"
del /f /q "%X_SYS%\InputService.dll.org"

rem 24H2, 25H2 Updated December 2025 and 26H2 later
if %VER[3]% GEQ 26100 (
    if %VER[4]% GEQ 7462 (
        call :InputSwitcherStandalone_26100.7462later
    )
)

goto :EOF

:InputSwitcherStandalone_26100.7462later
binmay -u "%X_SYS%\InputSwitch.dll"  -s "83 7B 10 07" -r "83 7B 10 FF"
ren "%X_SYS%\InputSwitch.dll.org" InputSwitch.dll.1.org
binmay -U "%X_SYS%\InputSwitch.dll" -s "80 B9 21 01 00 00 00" -r "80 B9 21 01 00 00 FF"
ren "%X_SYS%\InputSwitch.dll.1.org" InputSwitch.dll.org
fc /b "%X_SYS%\InputSwitch.dll.org" "%X_SYS%\InputSwitch.dll"
del /f /q /a InputSwitch.dll.org
goto :EOF
