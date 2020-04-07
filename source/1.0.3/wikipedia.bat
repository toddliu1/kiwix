@echo off
title wikipedia
color 0A

echo Starting wikipedia... ...
echo.
echo Do not close this Window!!!

start http://localhost

for %%i in (360se,360chrome,chrome,msedge,iexplore) do (
	for /f "tokens=2" %%a in ('tasklist /FI "imagename EQ %%i.exe" /NH') do (
	echo %%a | findstr "[0-9]">nul && bin\kiwix-serve.exe -a %%a -d -i 0.0.0.0 data\wikipedia_en_all_maxi_2018-10.zim data\wikipedia_zh_all_maxi_2020-03.zim data\wikipedia_en_computer_maxi_2020-02.zim data\wikipedia_zh_computer_maxi_2019-10.zim && goto END
)
)
:END