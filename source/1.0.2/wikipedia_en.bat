@echo off
title wikipedia for computer
color 0A

echo starting wikipedia... ...
echo.
echo Do not close this Window!!!

start http://localhost

bin\kiwix-serve.exe -d -i 0.0.0.0 data\wikipedia_en_all_maxi_2018-10.zim