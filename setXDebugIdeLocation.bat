@echo off

FOR /F "tokens=4 delims= " %%i in ('route print ^| find " 0.0.0.0"') do set IP_ADDRESS=%%i

echo Your IP Address is: %IP_ADDRESS%

REM Echo the IP_ADDRESS for debugging purposes
echo IP Address: %IP_ADDRESS%

REM Check if the IP address was obtained successfully
if "%IP_ADDRESS%"=="" (
    echo Failed to retrieve IP address.
    pause
    exit /b 1
)

REM Transmit the IP address to WSL
wsl ddev config global --xdebug-ide-location=%IP_ADDRESS%

REM Check if the command was successful
if %errorlevel% equ 0 (
    echo IP address %IP_ADDRESS% transmitted to WSL successfully.
) else (
    echo Failed to transmit IP address to WSL.
    pause
    exit /b 1
)