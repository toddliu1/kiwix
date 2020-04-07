@echo off
title wikipedia
color 0A

::show the kiwix server address
echo Starting wikipedia... ...
echo.
echo Now you can visit kiwix by entering the following address in your browser:
for /f "tokens=2 delims=:(" %%s in ('ipconfig /all ^| findstr /i "ipv4"') do @echo Kiwix Server:%%s
echo.
echo Do not close this Window!!!

::get all *.zim filenames under data
setlocal enabledelayedexpansion
for %%j in (data\*.zim) do set k=!k! %%j
setlocal disabledelayedexpansion

::start the default browser
start http://localhost

::check the browser and attached kiwix-serve.exe to it.
::when the browser is closed and then will kill kiwix-serve.exe services.
for %%i in (360se,360chrome,chrome,firefox,msedge,iexplore) do (
	for /f "tokens=2" %%a in ('tasklist /FI "imagename EQ %%i.exe" /NH') do (
	echo %%a | findstr "[0-9]">nul && bin\kiwix-serve.exe -a %%a -d -i 0.0.0.0 %k% && goto END
)
)
:END