@echo off

:: Admin-check
net.exe session 1>NUL 2>NUL || (echo Start the script as admin! & pause & exit)

echo Press any Key to start
pause

::Delete User Data Folders
set folder="\Program Files (x86)\Steam\userdata" 
cd /d %folder%
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)

::Delete Regedit Keys
REG DELETE HKEY_CURRENT_USER\Software\Valve\Steam\Users\ /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Valve\Users /f 
REG DELETE HKEY_CURRENT_USER\Software\Valve\Steam /f
REG DELETE HKEY_CURRENT_USER\Software\Valve /f 
REG DELETE HKEY_LOCAL_MACHINE\Software\Valve\Steam\Users /f 
REG DELETE HKEY_LOCAL_MACHINE\Software\Valve /f 
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Steam /f 
REG DELETE HKEY_CURRENT_USER\Software\Classes\Steam /f 
REG DELETE HKEY_CLASSES_ROOT\Steam /f
ping -n 2 127.0.0.1>nul

cls 
echo Finished!
pause
