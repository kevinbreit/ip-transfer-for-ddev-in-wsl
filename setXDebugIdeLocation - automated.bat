@echo off

set OLD_IP=0

:loop

set NEW_IP=""

:get_ip
FOR /F "tokens=4 delims= " %%i in ('route print ^| find " 0.0.0.0"') do set NEW_IP=%%i

if "%OLD_IP%" neq "%NEW_IP%" (
    echo IP address changed from %OLD_IP% to %NEW_IP%
    call setXDebugIdeLocation.bat %NEW_IP%

    :: dont execute the alert box on the first start
    if not %OLD_IP%==0 (
        if exist msgbox.vbs (
            echo "msgbox.vbs already exists and will be used as alert"
        ) else (
            echo x=msgbox^("Your IP-Address changed. Please restart your ddev container if you want to use Xdebug" ,0, "Your IP-Address changed!"^) >> msgbox.vbs
        )

        start msgbox.vbs
    )

    set OLD_IP=%NEW_IP%
)

timeout /t 5 >nul
:: del msgbox.vbs
goto loop