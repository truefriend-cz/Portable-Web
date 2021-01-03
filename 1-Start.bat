@echo off
set "ThisDir=%~dp0"
set "ThisDir=%ThisDir:~0,-1%"


echo Checking if already runing...

ping 127.0.0.1 -n 1 >nul 2>&1

taskkill /f /IM nginx.exe >nul 2>&1
taskkill /f /IM php-cgi.exe >nul 2>&1
taskkill /f /IM mysqld.exe >nul 2>&1

echo Starting FastCGI...
pushd "%ThisDir%\php\php-7.3.4\"
start %ThisDir%\bins\RunHiddenConsole.exe php-cgi.exe -b 127.0.0.1:9123
popd
ping 127.0.0.1 -n 1 >nul 2>&1
qprocess "php-cgi.exe" >nul 2>&1
if %errorlevel% equ 0 echo FastCGI is now running.

echo Starting NGINX...
pushd "%ThisDir%\nginx\"
start nginx.exe
popd
ping 127.0.0.1 -n 1 >nul 2>&1
qprocess "nginx.exe" >nul 2>&1
if %errorlevel% equ 0 echo NGINX is now running.

echo Starting MySQL...
pushd "%ThisDir%\mariadb\bin\"
start %ThisDir%\bins\RunHiddenConsole.exe mysqld.exe
popd
ping 127.0.0.1 -n 1 >nul 2>&1
qprocess "mysqld.exe" >nul 2>&1
if %errorlevel% equ 0 echo MySQL is now running.

