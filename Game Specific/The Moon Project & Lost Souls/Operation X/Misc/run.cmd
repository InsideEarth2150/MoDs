@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [!] ERROR: This script must be run as Administrator.
    echo Please right-click the script and select "Run as administrator".
    pause
    exit /b 1
)

echo ===================================================
echo   Application Control ^& Execution Policy Reset
echo ===================================================
echo.

echo [*] Stopping Application Identity Service (AppIDSvc)...
sc stop AppIDSvc >nul 2>&1
echo [*] Disabling AppIDSvc startup configuration...
sc config AppIDSvc start= disabled >nul 2>&1

echo [*] Removing registry-level execution restrictions...
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\SrpV2" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1

set "TARGET_EXE=C:\temp\OPX\Beta II\opxbeta2ls.exe"

if exist "%TARGET_EXE%" (
    echo [*] Launching target binary: "%TARGET_EXE%"
    powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; Start-Process -FilePath '%TARGET_EXE%' -Verb RunAs"
    echo [+] Process launch initiated.
) else (
    echo [-] ERROR: Target file not found at: "%TARGET_EXE%"
)

echo.
echo ===================================================
echo Done. Press any key to exit.
echo ===================================================
pause