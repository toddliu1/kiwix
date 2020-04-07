@echo off
title 维基百科
color 0A

::显示kiwix server地址
echo 正在启动 维基百科... ...
echo.
echo 现在你可以在浏览器中输入以下地址访问维基百科：
for /f "tokens=2 delims=:(" %%s in ('ipconfig /all ^| findstr /i "ipv4"') do @echo Kiwix地址:%%s
echo.
echo 请勿关闭此窗口！！！

::取得data文件夹下所有zim文件的文件名
setlocal enabledelayedexpansion
for %%j in (data\*.zim) do set k=!k! %%j
setlocal disabledelayedexpansion

::启动默认浏览器
start http://localhost

::检查用户浏览器，启动kiwix-serve服务并绑定到用户浏览器进程
::当用户关闭浏览器后，kiwix-serve服务窗口会自动关闭
for %%i in (360se,360chrome,chrome,firefox,msedge,iexplore) do (
	for /f "tokens=2" %%a in ('tasklist /FI "imagename EQ %%i.exe" /NH') do (
	echo %%a | findstr "[0-9]">nul && bin\kiwix-serve.exe -a %%a -d -i 0.0.0.0 %k% && goto END
)
)
:END