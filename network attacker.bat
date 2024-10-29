@echo off
color 0A
mode con cols=120 lines=30

if errorlevel 1 (
   echo An error occurred
   echo Error level: %errorlevel%
   echo Press Enter to exit...
   pause
   exit /b %errorlevel%
) else (
    echo Command succeeded!
)

:start
chcp 65001 <nul
call :banner
echo WPS Brute-Force Attack [!]
echo Please input the target IP address
set /p inputIP="Enter IP address: "

echo [!]
echo Please input the target MAC address
set /p inputMAC="Enter MAC address: "

REM Basic MAC address validation
echo %inputMAC% | findstr /r "^[0-9A-Fa-f]\{2\}[:-][0-9A-Fa-f]\{2\}[:-][0-9A-Fa-f]\{2\}[:-][0-9A-Fa-f]\{2\}[:-][0-9A-Fa-f]\{2\}[:-][0-9A-Fa-f]\{2\}$" >nul

if errorlevel 1 (
   echo Invalid MAC address format.
   echo Exiting...
   exit /b
)

echo %inputIP% | findstr /r "^[0-1][0-9][0-9]?\.[0-1][0-9][0-9]?\.[0-1][0-9][0-9]?\.[0-1][0-9][0-9]?$" >nul
if errorlevel 1 (
    echo Invalid IP address format.
    exit /b
)

echo %inputIP% | findstr /r "^[2][0-4][0-9]\.[0-9][0-9]?\.[0-9][0-9]?\.[0-9][0-9]?$" >nul
if errorlevel 1 (
    echo Invalid IP address format.
    exit /b
)

echo %inputIP% | findstr /r "^[2][5][0-5]\.[0-9][0-9]?\.[0-9][0-9]?\.[0-9][0-9]?$" >nul
if errorlevel 1 (
    echo Invalid IP address format.
    exit /b
)

if errorlevel 1 (
    echo Invalid IP address format.
    echo Press Enter to exit.
    pause >nul
    exit /b
) else (
    goto attack
)


:attack
echo WPS attack starting...

:banner
echo ███╗   ██╗███████╗████████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗     █████╗ ████████╗████████╗ █████╗  ██████╗██╗  ██╗███████╗██████╗ 
echo ████╗  ██║██╔════╝╚══██╔══╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝    ██╔══██╗╚══██╔══╝╚══██╔══╝██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗
echo ██╔██╗ ██║█████╗     ██║   ██║ █╗ ██║██║   ██║██████╔╝█████╔╝     ███████║   ██║      ██║   ███████║██║     █████╔╝ █████╗  ██████╔╝
echo ██║╚██╗██║██╔══╝     ██║   ██║███╗██║██║   ██║██╔══██╗██╔═██╗     ██╔══██║   ██║      ██║   ██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗
echo ██║ ╚████║███████╗   ██║   ╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗    ██║  ██║   ██║      ██║   ██║  ██║╚██████╗██║  ██╗███████╗██║  ██║
echo ╚═╝  ╚═══╝╚══════╝   ╚═╝    ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝    ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
echo Visit at https://github.com/gukitoguka12 for more

echo [+] Loading WPS attack operations...
echo [!] You might encounter errors.
