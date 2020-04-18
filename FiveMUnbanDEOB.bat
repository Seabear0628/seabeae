@echo off
mode 175 ,13
:init
 setlocal DisableDelayedExpansion
 set cmdInvoke=1
 set winSysFolder=System32
 set "batchPath=%~0"
 for %%k in (%0) do set batchName=%%~nk
 set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
 setlocal EnableDelayedExpansion

:checkPrivileges
  NET FILE 1>NUL 2>NUL
  if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
  if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)

  ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
  ECHO args = "ELEV " >> "%vbsGetPrivileges%"
  ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
  ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
  ECHO Next >> "%vbsGetPrivileges%"

  if '%cmdInvoke%'=='1' goto InvokeCmd

  ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
  goto ExecElevation

:InvokeCmd
  ECHO args = "/c """ + "!batchPath!" + """ " + args >> "%vbsGetPrivileges%"
  ECHO UAC.ShellExecute "%SystemRoot%\%winSysFolder%\cmd.exe", args, "", "runas", 1 >> "%vbsGetPrivileges%"

:ExecElevation
 "%SystemRoot%\%winSysFolder%\WScript.exe" "%vbsGetPrivileges%" %*
 exit /B

:gotPrivileges
 setlocal & cd /d %~dp0
 if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

:loading
@echo off
title [FiveM Unban Tool] Loading...
cls
color a
echo  ________  _______   ________   ___  _________  ___  ___          ___  ___  ________   ________  ________  ________           _________  ________  ________  ___          
echo [\_____  \[\  ___ \ [\   ___  \[\  \[\___   ___[\  \[\  \        [\  \[\  \[\   ___  \[\   __  \[\   __  \[\   ___  \        [\___   ___[\   __  \[\   __  \[\  \         
echo  \[___/  /\ \   __/[\ \  \\ \  \ \  \[___ \  \_\ \  \\\  \       \ \  \\\  \ \  \\ \  \ \  \[\ /\ \  \[\  \ \  \\ \  \       \[___ \  \_\ \  \[\  \ \  \[\  \ \  \        
echo      /  / /\ \  \_[/_\ \  \\ \  \ \  \   \ \  \ \ \   __  \       \ \  \\\  \ \  \\ \  \ \   __  \ \   __  \ \  \\ \  \           \ \  \ \ \  \\\  \ \  \\\  \ \  \       
echo     /  /_/__\ \  \_[\ \ \  \\ \  \ \  \   \ \  \ \ \  \ \  \       \ \  \\\  \ \  \\ \  \ \  \[\  \ \  \ \  \ \  \\ \  \           \ \  \ \ \  \\\  \ \  \\\  \ \  \____  
echo    [\________\ \_______\ \__\\ \__\ \__\   \ \__\ \ \__\ \__\       \ \_______\ \__\\ \__\ \_______\ \__\ \__\ \__\\ \__\           \ \__\ \ \_______\ \_______\ \_______\
echo     \[_______[\[_______[\[__[ \[__[\[__[    \[__[  \[__[\[__[        \[_______[\[__[ \[__[\[_______[\[__[\[__[\[__[ \[__[            \[__[  \[_______[\[_______[\[_______[
echo.
echo ------------------------------\
echo Loading...   Please Wait
echo ------------------------------/
echo.
timeout 6 >nul

goto :Main
:Main
mode 175 ,27
title [FiveM Unban Tool Main Menu]
cls
@echo off
color a 
echo  ________  _______   ________   ___  _________  ___  ___          ___  ___  ________   ________  ________  ________           _________  ________  ________  ___          
echo [\_____  \[\  ___ \ [\   ___  \[\  \[\___   ___[\  \[\  \        [\  \[\  \[\   ___  \[\   __  \[\   __  \[\   ___  \        [\___   ___[\   __  \[\   __  \[\  \         
echo  \[___/  /\ \   __/[\ \  \\ \  \ \  \[___ \  \_\ \  \\\  \       \ \  \\\  \ \  \\ \  \ \  \[\ /\ \  \[\  \ \  \\ \  \       \[___ \  \_\ \  \[\  \ \  \[\  \ \  \        
echo      /  / /\ \  \_[/_\ \  \\ \  \ \  \   \ \  \ \ \   __  \       \ \  \\\  \ \  \\ \  \ \   __  \ \   __  \ \  \\ \  \           \ \  \ \ \  \\\  \ \  \\\  \ \  \       
echo     /  /_/__\ \  \_[\ \ \  \\ \  \ \  \   \ \  \ \ \  \ \  \       \ \  \\\  \ \  \\ \  \ \  \[\  \ \  \ \  \ \  \\ \  \           \ \  \ \ \  \\\  \ \  \\\  \ \  \____  
echo    [\________\ \_______\ \__\\ \__\ \__\   \ \__\ \ \__\ \__\       \ \_______\ \__\\ \__\ \_______\ \__\ \__\ \__\\ \__\           \ \__\ \ \_______\ \_______\ \_______\
echo     \[_______[\[_______[\[__[ \[__[\[__[    \[__[  \[__[\[__[        \[_______[\[__[ \[__[\[_______[\[__[\[__[\[__[ \[__[            \[__[  \[_______[\[_______[\[_______[
echo.
echo ================================== ==
echo ==       FiveM Unban Tool       == ==
echo ================================== ==
echo         Developer:Eon#3017         ==
echo          Tool Version 2.0          ==
echo      DONT ALLOW FIVEM TO DISCORD   ==
echo      ===========================   ==
echo         1 - Run Spoofer            ==
echo         2 - Run Cleaner 1          ==
echo         3 - Run Cleaner 2          ==
echo         4 - Display HWID's         ==
echo         5 - Show Instructions      ==
echo         6 - Exit Tool              ==
echo =====================================
echo =====================================
echo.
set /P A=Choose:

IF %A%==1 goto :prespoof
IF %A%==2 goto :folderclean
IF %A%==3 goto :xboxclean
IF %A%==4 goto :curHWID
IF %A%==5 goto :Inst
IF %A%==6 goto :Exit

:prespoof
mode 65 ,17
@echo off
cls
color a
echo ======================
echo ==     Spoofing...  ==
echo ======================
timeout 3 >nul
goto :Spoof

:Spoof
mode 60,15
title [FIVEM UNBAN TOOL SPOOFER]
@echo off
set hostspath=%windir%\System32\drivers\etc\hosts
echo 127.0.0.1 xboxlive.com >> %hostspath%
echo 127.0.0.1 user.auth.xboxlive.com >> %hostspath%
echo 127.0.0.1 presence-heartbeat.xboxlive.com >> %hostspath%

rd %userprofile%\AppData\Local\DigitalEntitlements /q /s
cls
echo. 
echo                    ----------------
echo                     Task Completed. 
echo                    ----------------
echo.
echo.          
echo.
echo.
echo.
echo.
echo.  
echo               ^<PRESS ENTER TO RETURN^>    
pause >nul
goto :Main 

:Exit
@echo off
del "%~f0" & exit

:curHWID
setlocal EnableDelayedExpansion
cls
set /a "lo=1"

for /f "skip=1 tokens=1" %%a in ('wmic diskdrive get serialnumber') do (
   set "disk=%%a"
   goto :n2
)
:n2
cls
:: bios serial 
for /f "skip=1 tokens=1" %%b in ('wmic bios get serialnumber') do (
   set "bios=%%b"
   goto :n3
)
:n3
for /f "skip=1 tokens=1" %%c in ('wmic cpu get serialnumber') do (
    set "cpu=%%c"
    goto :n4
)
:n4
for /f "delims= skip=1" %%d in ('wmic baseboard get serialnumber') do (
    set "baseb=%%d"
    goto :n5
)
:n5
for /f "skip=1 tokens=1" %%e in ('wmic MEMORYCHIP get serialnumber') do (
   if "!lo!" equ "1" (
      set "ram1=%%e"
   ) else (
      if "!lo!" equ "2" (
         set "ram2=%%e"  
      ) else (
         goto :n6
      )
   )
   set /a "lo=!lo!+1"
)
:n6
for /f "skip=1" %%f in ('wmic csproduct get UUID') do (
   set "uuid=%%f"
   goto :n7
)
:n7
if "%cpu%" equ "To" set "cpu=To be filled"
goto :resultsHWID

:resultsHWID
title [FIVEM UNBAN TOOL HWID]
mode 90 ,15
echo.
echo 		[FIVEM UNBAN TOOL HWID]
echo   		---------------------------------------------------
echo      		* Bios: %bios%
echo      		* CPU: %cpu%
echo      		* Baseboard: %baseb%
echo      		* RAM: %ram1%, %ram2%
echo      		* UUID: %uuid%
echo   		---------------------------------------------------
echo.
echo.
echo.
echo               		^<PRESS ENTER TO RETURN^>
pause>nul
goto :Main

:folderclean
mode 55,15
title [FIVEM UNBAN TOOL CLEANER]
call :getDiscordVersion
cls
del /s /f /q "%appdata%\CitizenFX" >nul 2>nul 
del /s /f /q "%localappdata%\DigitalEntitlements" >nul 2>nul
call :errorcheck
cls
echo. 
echo                    ----------------
echo                     Task Completed. 
echo                    ----------------
echo.
echo.          
echo.
echo.
echo.
echo.
echo.  
echo               	^<PRESS ENTER TO RETURN^>    
pause >nul
goto :Main  
:getDiscordVersion
for /d %%a in ("%appdata%\Discord\*") do (
   set "varLoc=%%a"
   goto :d1
)
:d1
for /f "delims=\ tokens=7" %%z in ('echo %varLoc%') do (
   set "discordVersion=%%z"
)
goto :EOF

:xboxclean
mode 60,15
title [FIVEM UNBAN TOOL CLEANER]
cls
powershell -Command "& {Get-AppxPackage -AllUsers xbox [ Remove-AppxPackage}" >NUL 2>NUL
sc stop XblAuthManager >NUL 2>NUL
sc stop XblGameSave >NUL 2>NUL
sc stop XboxNetApiSvc >NUL 2>NUL
sc stop XboxGipSvc >NUL 2>NUL
sc delete XblAuthManager >NUL 2>NUL
sc delete XblGameSave >NUL 2>NUL
sc delete XboxNetApiSvc >NUL 2>NUL
sc delete XboxGipSvc >NUL 2>NUL
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\xbgm" /f >NUL 2>NUL
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTask" /disable >NUL 2>NUL
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTaskLogon" /disable >NUL 2>NUL
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f >NUL 2>NUL
call :errorcheck
cls
echo. 
echo                    ----------------
echo                     Task Completed. 
echo                    ----------------
echo.
echo.          
echo.
echo.
echo.
echo.
echo.  
echo               	^<PRESS ENTER TO RETURN^>    
pause >nul
goto :Main

:errorcheck 
if %errorlevel% EQU 1 (
    cls
    echo Failed. 
    timeout /t 3 >nul 2>nul
    exit /b
) else (
    rem do nothing :)
    goto :eof
)

:Inst
@echo off
cls
echo ==============================================
echo ==          UNBAN TOOL INSTRUCTIONS         ==
echo ==============================================
echo 1.Run Spoofer
echo 2.Run Cleaner 1
echo 3.Run Cleaner 3
echo 4.Close Tool
echo 5.Restart PC
echo 6.Run FiveM
echo 7.Login With a New Unbanned! Account
echo.
echo.
echo.
echo     ^<PRESS ENTER TO RETURN^>    
echo.
echo.
echo.
echo.
echo -=-=SIDE NOTE=-=-
echo ALWAYS DECLINE DISCORD TO FIVEM AUTH
echo -=-=SIDE NOTE=-=-
pause >nul
goto :Main