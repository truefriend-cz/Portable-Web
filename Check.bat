@echo off

set running=0

qprocess "nginx.exe" >nul 2>&1
if %errorlevel% equ 0 (
	echo nginx.exe is running!
	set running=1
)
qprocess "mariadbd.exe" >nul 2>&1
if %errorlevel% equ 0 (
	echo mariadbd.exe is running!
	set running=1
)
qprocess "php-cgi.exe" >nul 2>&1
if %errorlevel% equ 0 (
	echo php-cgi.exe is running!
	set running=1
)

if %running% equ 0 (
	echo Any apps from this pack is not running!
)

ping 127.0.0.1 -n 4 >nul 2>&1

exit