@echo off
chcp 1251
cls
:x00
echo.
echo  ----------------------------------------------------------
echo      Меню
echo  ----------------------------------------------------------
echo  1 - Анализ текущего состояния хранилища компонент (WinSxS) 
echo  2 - Удаление предыдущих версий для текущего пользователя
echo  3 - Полное удаление предыдущих версий
echo  0 - Выход         
echo  ----------------------------------------------------------
echo.

SET /P N=" Введите номер: "

if /i '%N%'=='1' goto x1
if /i '%N%'=='2' goto x2
if /i '%N%'=='3' goto x3
if /i '%N%'=='0' goto x0

:x1
cls
echo.
echo "1 - Анализ текущего состояния хранилища компонент (WinSxS)"
Dism.exe /Online /Cleanup-Image /AnalyzeComponentStore
echo.
pause
goto x0

:x2
cls
echo.
echo "2 - Удаление предыдущих версий для текущего пользователя"
Dism.exe /Online /Cleanup-Image /StartComponentCleanup
echo.
pause
goto x0


:x3
cls
echo.
echo "3 - Полное удаление предыдущих версий"
Dism.exe /Online /Cleanup-Image /StartComponentCleanup /ResetBase
echo.
pause
goto x0

:x0
exit
