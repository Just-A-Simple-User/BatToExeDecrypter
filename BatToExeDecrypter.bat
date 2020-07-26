@echo off
title Bat To Exe source code grabber by Just-A-Simple-User v2.0
echo Thanks to TheBATeam for helping with this project https://discord.gg/TvtH9BV
echo _____________________________________________________________________________
echo Instruction:
echo 1. Run the script
echo 2. Run the program you want, just after you see the message that tells you you can {make sure to do everything of this in a VM}
echo 3. Done
pause


::Directories
SET Desktop="%userprofile%\Desktop"
SET TempFolder="%localappdata%\Temp"

:DesktopCheck
IF EXIST %Desktop%\Captures (
GOTO BackUpCheck
)
IF NOT EXIST %Desktop%\Captures (
cd %Desktop%
md Captures
GOTO BackUpCheck
)

:BackUpCheck
IF EXIST %Desktop%\BackUpBatches (
GOTO FirstCheck
)
IF NOT EXIST %Desktop%\BackUpBatches (
cd %Desktop%
md BackUpBatches
GOTO FirstCheck
)

:: 1stCheckBat
:FirstCheck
dir /S /B /a %TempFolder%\*.bat 2>nul 1>nul
if %errorlevel% neq 0 (GOTO 1stNotFound) else (GOTO 1stFound)

:1stFound
cd %TempFolder%
xcopy /s "%TempFolder%\*.bat" "%Desktop%\BackUpBatches"
DEL /S /Q *.BAT *.TMP
cls
echo Thanks to TheBATeam for helping with this project https://discord.gg/TvtH9BV
echo _____________________________________________________________________________
echo You can run your file after pressing enter
pause
GOTO Checking

:1stNotFound
goto checking



::1stCheckTmp
dir /S /B /a %TempFolder%\*.tmp 2>nul 1>nul
if %errorlevel% neq 0 (GOTO 1stNotFound) else (GOTO 1stFound)

:1stFound
cd %TempFolder%
xcopy /s "%TempFolder%\*.bat" "%Desktop%\BackUpBatches"
DEL /S /Q *.BAT *.TMP
cls
echo Thanks to TheBATeam for helping with this project https://discord.gg/TvtH9BV
echo _____________________________________________________________________________
echo You can run your file after pressing enter
pause
GOTO Checking

:1stNotFound
goto checking

::Actual checking
:Checking
dir /S /B /a %TempFolder%\*.bat 2>nul 1>nul
if %errorlevel% neq 0 (GOTO NotFound) else (GOTO Found)

:Found
GOTO FoundLoop
:FoundFinish
cls
echo Thanks to TheBATeam for helping with this project https://discord.gg/TvtH9BV
echo _____________________________________________________________________________
echo ! Here's the source code !
start %windir%\explorer.exe "%Desktop%\Captures"
pause
exit

:FoundLoop
IF EXIST "%TempFolder%\is64.bat" (
cd %TempFolder%
del is64.bat
cls
color 0c
echo ADVANCED BAT TO EXE DETECTED !
timeout /t 5 > nul
cls
color 07
echo Now that that program crashed hit close and then enter
pause
xcopy /s "%TempFolder%\xtmp\*.bat" "%Desktop%\Captures"
del %TempFolder%\xtmp\*.* /s /q /y
rmdir xtmp
rmdir efolder
del is64.txt
GOTO ifNOt
)

:ifNOt
xcopy /s "%TempFolder%\*.bat" "%Desktop%\Captures"
GOTO FoundFinish


:NotFound
echo Rechecking until code detected...
GOTO Checking