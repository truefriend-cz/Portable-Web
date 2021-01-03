@echo off
set "ThisDir=%~dp0"
set "ThisDir=%ThisDir:~0,-1%"

echo Ending NGINX...
pushd "%ThisDir%\nginx\"
start nginx.exe -s quit
popd

echo Ending MySQL...
pushd "%ThisDir%\mariadb\bin\"
rem MySqlAdmin -u root -p rootpassword Shutdown
start %ThisDir%\bins\RunHiddenConsole.exe mysqladmin.exe -u root Shutdown
popd

echo Ending FastCGI...
taskkill /f /IM php-cgi.exe >nul 2>&1

ping 127.0.0.1 -n 8 >nul 2>&1

qprocess "nginx.exe" >nul 2>&1
if %errorlevel% equ 0 (
	echo nginx.exe is running!
	pause
)
qprocess "mysqld.exe" >nul 2>&1
if %errorlevel% equ 0 (
	echo mysqld.exe is running!
	pause
)
qprocess "php-cgi.exe" >nul 2>&1
if %errorlevel% equ 0 (
	echo php-cgi.exe is running!
	pause
)

exit