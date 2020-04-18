@echo off
color b
timeout 2 >nul
echo [+] Initializing Launcher... 
timeout 3 >nul
cls
goto :Main

:Main
@echo off
cls
color b
mode 175 ,18
echo  ________  __                       __       __        __                                 ________                                            __                         
echo [        \[  \                     [  \     /  \      [  \                               [        \                                          [  \                        
echo [ $$$$$$$$ \$$ __     __   ______  [ $$\   /  $$      [ $$      __    __   ______        [ $$$$$$$$ __    __   ______    _______  __    __  _[ $$_     ______    ______  
echo [ $$__    [  \[  \   /  \ /      \ [ $$$\ /  $$$      [ $$     [  \  [  \ [      \       [ $$__    [  \  /  \ /      \  /       \[  \  [  \[   $$ \   /      \  /      \ 
echo [ $$  \   [ $$ \$$\ /  $$[  $$$$$$\[ $$$$\  $$$$      [ $$     [ $$  [ $$  \$$$$$$\      [ $$  \    \$$\/  $$[  $$$$$$\[  $$$$$$$[ $$  [ $$ \$$$$$$  [  $$$$$$\[  $$$$$$\
echo [ $$$$$   [ $$  \$$\  $$ [ $$    $$[ $$\$$ $$ $$      [ $$     [ $$  [ $$ /      $$      [ $$$$$      $$  $$ [ $$    $$[ $$      [ $$  [ $$  [ $$ __ [ $$  [ $$[ $$   \$$
echo [ $$      [ $$   \$$ $$  [ $$$$$$$$[ $$ \$$$[ $$      [ $$_____[ $$__/ $$[  $$$$$$$      [ $$_____  /  $$$$\ [ $$$$$$$$[ $$_____ [ $$__/ $$  [ $$[  \[ $$__/ $$[ $$      
echo [ $$      [ $$    \$$$    \$$     \[ $$  \$ [ $$      [ $$     \\$$    $$ \$$    $$      [ $$     \[  $$ \$$\ \$$     \ \$$     \ \$$    $$   \$$  $$ \$$    $$[ $$      
echo  \$$       \$$     \$      \$$$$$$$ \$$      \$$       \$$$$$$$$ \$$$$$$   \$$$$$$$       \$$$$$$$$ \$$   \$$  \$$$$$$$  \$$$$$$$  \$$$$$$     \$$$$   \$$$$$$  \$$      
echo.
echo ========================
echo == 1. Inject Executor ==
echo == 2. Close Injector  ==
echo ========================
echo == HWID STATUS:LOCKED ==
echo ========================
set /P A=Choose:

IF %A%==1 goto :Inject
IF %A%==2 goto :exit

:Inject
mode 150 ,45
color b
@echo off
cls
timeout 2 >nul
echo [+] Found FiveM!
timeout 3 >nul
echo [+] Loading Module - FiveM Module v1.8
timeout 2 >nul
echo [+] Adding Custom Lua Wrapper
timeout 2 >nul
echo [+] Injecting...
timeout 3 >nul
echo [+] Ready!
timeout 2 >nul
exit
:exit
exit