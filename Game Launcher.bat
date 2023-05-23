@echo off
setlocal enabledelayedexpansion
if not exist "%APPDATA%\VerrucktGameLauncher" (
        echo Creating Directories
        timeout /T 0 /NOBREAK >nul
    mkdir "%APPDATA%\VerrucktGameLauncher"
)
    if not exist "%APPDATA%\VerrucktGameLauncher\discordwarningmsg.vbs" (
        cd %APPDATA%\VerrucktGameLauncher
    powershell -Command "Invoke-WebRequest https://cdn.discordapp.com/attachments/1108623165518786561/1108624226354733126/warning_message.vbs -Outfile discordwarningmsg.vbs"
    )
echo Checking for updates...
set "batch_file=%~f0"
cd %APPDATA%\VerrucktGameLauncher
curl -s "https://pastebin.com/raw/BApLvk1W" > "version.txt"
set /p remote_version=<"version.txt"
set local_version=1.0

if "%remote_version%" neq "%local_version%" (
    echo Upgrading from %local_version% to %remote_version%...
    curl -s "https://raw.githubusercontent.com/Polizei123/Game-Launcher/main/launcher" > "%batch_file%"
    echo Upgrade complete.
    timeout /T 2 /NOBREAK >nul
)
title Game Launcher   I   Games: Fortnite, TitanFall 2  I   Launchers: Steam, Epic   I   Misc: Discord, Spotify 
echo Alert: If you are NOT verruckt and you are using this script then it may or may not work due to it assuming the paths of the games.
timeout /t 5 >nul
cls
:menu
cls
echo Select an option:
echo 1. Fortnite
echo 2. Steam
echo 3. Epic Launcher
echo 4. Discord
echo 5. Spotify
echo 6. Titanfall 2 (Steam)
echo.

set /p choice=Enter your choice (1-6): 

if "%choice%"=="1" (
    echo Starting Fortnite...
    cd "C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64"
    start FortniteClient-Win64-Shipping.exe
    timeout /t 2 >nul
    cls
    call :option1
) else if "%choice%"=="2" (
        echo Starting Steam...
    cd "C:\Program Files (x86)\Steam"
    start steam.exe
    timeout /t 2 >nul
    cls
    call :option2
) else if "%choice%"=="3" (
    echo Starting Epic Launcher...
    cd "C:\Program Files (x86)\Epic Games\Launcher\Portal\Binaries\Win64"
    start EpicGamesLauncher.exe
    timeout /t 2 >nul
    cls
    call :option3
) else if "%choice%"=="4" (
    cd %APPDATA%\VerrucktGameLauncher
    discordwarningmsg.vbs
    timeout /t 2 >nul 
    echo Starting Discord...
    cd "C:\Users\%username%\AppData\Local\Discord\app-1.0.9013"
    start Discord.exe
    cls
    call :option4
) else if "%choice%"=="5" (
    call :option5
) else if "%choice%"=="6" (
    start steam://rungameid/1237970
    call :option6
) else (
    echo Invalid choice. Please try again.
    pause
    goto menu
)

:option1
cls
echo Option 1:
echo 1. Return to Hub
echo 2. Stop Fortnite
echo.

set /p subchoice=Enter your choice (1-2): 

if "%subchoice%"=="1" (
    goto menu
) else if "%subchoice%"=="2" (
    echo Attempting to kill Fortnite...
    taskkill /f /im FortniteClient-Win64-Shipping.exe
    pause
    goto option1
) else (
    echo Invalid choice. Please try again.
    pause
    goto option1
)

:option2
cls
echo Option 2:
echo 1. Return to Hub
echo 2. Stop Steam
echo.

set /p subchoice=Enter your choice (1-2): 

if "%subchoice%"=="1" (
    goto menu
) else if "%subchoice%"=="2" (
    echo Attempting to kill Steam...
    taskkill /f /im steam.exe
    pause
    goto option2
) else (
    echo Invalid choice. Please try again.
    pause
    goto option2
)

:option3
cls
echo Option 3:
echo 1. Return to Hub
echo 2. Stop Epic Launcher
echo.

set /p subchoice=Enter your choice (1-2): 

if "%subchoice%"=="1" (
    goto menu
) else if "%subchoice%"=="2" (
    echo Attempting to kill the Epic Launcher...
    taskkill /f /im EpicGamesLauncher.exe
    pause
    goto option3
) else (
    echo Invalid choice. Please try again.
    pause
    goto option3
)

:option4
cls
echo Option 4:
echo 1. Return to Hub
echo 2. Stop Discord
echo.

set /p subchoice=Enter your choice (1-2): 

if "%subchoice%"=="1" (
    goto menu
) else if "%subchoice%"=="2" (
    echo Attempting to kill Discord...
    taskkill /f /im Discord.exe
    pause
    goto option4
) else (
    echo Invalid choice. Please try again.
    pause
    goto option4
)

:option5
cls
echo Option 5:
echo 1. Return to Hub
echo 2. Option 5 Sub-Option
echo.

set /p subchoice=Enter your choice (1-2): 

if "%subchoice%"=="1" (
    goto menu
) else if "%subchoice%"=="2" (
    rem Add your code for Option 5 Sub-Option here
    echo Please add your code for Option 5 Sub-Option.
    pause
    goto option5
) else (
    echo Invalid choice. Please try again.
    pause
    goto option5
)
:option6
cls
echo TitanFall 2:
echo 1. Return to Hub
echo 2. Stop Titanfall 2
echo.

set /p subchoice=Enter your choice (1-2): 

if "%subchoice%"=="1" (
    goto menu
) else if "%subchoice%"=="2" (
    echo Stopping Titanfall 2.
    taskkill /f /im Titanfall2.exe
    pause
    goto option6
) else (
    echo Invalid choice. Please try again.
    pause
    goto option6
)

goto menu