@echo off
title 维基百科
color 0A

echo 正在启动 维基百科... ...
echo.
echo 请勿关闭此窗口！！！

start http://localhost

bin\kiwix-serve.exe -d -i 0.0.0.0 data\wikipedia_zh_all_maxi_2020-03.zim