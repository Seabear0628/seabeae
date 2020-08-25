@echo off
set "RAND=%random:~-1%%random:~-1%%random:~-1%"

cls
title Fall Sploit Mapper
color e
echo #=================================================#
echo  #       	  Fall Sploit Mapper             #
echo  #                Driver Mapper V2.1             #
echo  #                  Thread : 0x%RAND%               #
echo #=================================================#

echo.
TIMEOUT 1 >NUL

echo [+] Fetching Assets...
TIMEOUT 3 >NUL
echo.
echo [+] Mapping Driver...
TIMEOUT 4 >NUL
echo.
echo [+] Driver Mapped!
TIMEOUT 1 >NUL
EXIT

PAUSE >NUL