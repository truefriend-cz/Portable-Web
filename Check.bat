@echo off

qprocess "nginx.exe" >nul 2>&1
if %errorlevel% equ 0 (
	echo nginx.exe is running!
)
qprocess "mysqld.exe" >nul 2>&1
if %errorlevel% equ 0 (
	echo mysqld.exe is running!
)
qprocess "php-cgi.exe" >nul 2>&1
if %errorlevel% equ 0 (
	echo php-cgi.exe is running!
)

ping 127.0.0.1 -n 4 >nul 2>&1

exit