set _RELOAD_HIVE=0
reg query HKLM\Tmp_SOFTWARE /ve 1>nul 2>nul
if %errorlevel% EQU 0 (
    call PERegPorter.bat Tmp UNLOAD
    set _RELOAD_HIVE=1
)

echo [INFO] Add drivers:%cd%\Drivers_%WB_PE_ARCH%
Dism /Image:"%X%" /Add-Driver:Drivers_%WB_PE_ARCH% /Recurse /ForceUnsigned


if %_RELOAD_HIVE% EQU 1 (
   call PERegPorter.bat Tmp LOAD
)

set _RELOAD_HIVE=
