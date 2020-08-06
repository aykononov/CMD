CMD
======
Командный файл МЕНЮ для администрирования ПК.
-----------------------------------------------
```cmd
--------------------------
ARM_SpecSettings
--------------------------
1 - Включить USB 
2 - Отключить USB
3 - Локальный вход (вызов командной строки при входе в Windows для сброса пароля локального Администратора)
4 - Откат (Локальный вход)
5 - Очистка Far
6 - Удаленная перезагрузка ПК
7 - Сетевые настройки ПК
0 - Выход         
--------------------------
```
```cmd
@echo off
:x00
cls
echo.
echo  --------------------------
echo      ARM_SpecSettings
echo  --------------------------
echo  1 - Включить USB 
echo  2 - Отключить USB
echo  3 - Локальный вход
echo  4 - Откат (Локальный вход)
echo  5 - Очистка Far
echo  6 - Валютное Табло
echo  7 - Сетевые настройки SBCORP
echo  0 - Выход         
echo  --------------------------
echo.
SET /P N=" Введите номер: "

if /i '%N%'=='1' goto x1
if /i '%N%'=='2' goto x2
if /i '%N%'=='3' goto x3
if /i '%N%'=='4' goto x4
if /i '%N%'=='5' goto x5
if /i '%N%'=='6' goto x6
if /i '%N%'=='7' goto x7
if /i '%N%'=='0' goto x0
:x1
cls
echo.
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR /v Start /t REG_DWORD /d 00000003 /f
rem REG ADD HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR /v Start /t REG_DWORD /d 00000004 /f
echo.
echo  ------------
echo  USB включено 
echo  ------------
echo.
pause
goto x0

:x2
cls
echo.
rem REG ADD HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR /v Start /t REG_DWORD /d 00000003 /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR /v Start /t REG_DWORD /d 00000004 /f
echo.
echo  ------------
echo  USB отключено 
echo  ------------
echo.
pause
goto x0

:x3
cls
echo.
echo ------------------------------------------
echo "Завершение процесса"
TASKKILL /F /IM sethc.exe /T
echo.
echo "Смена владельца файла в Windows"
echo.
takeown /A /F "C:\Windows\System32\sethc.exe"
echo.
echo ------------------------------------------
echo "Установка прав доступа"
icacls C:\Windows\System32\sethc.exe /grant Администраторы:F

echo.
echo ------------------------------------------
echo "Резервирование файла"
copy /Y C:\Windows\System32\sethc.exe C:\Windows\System32\sethc.exe.bak

echo.
echo -------------------------------------------
echo "Переименование файла"
xcopy /F /H /R /Y C:\Windows\System32\cmd.exe C:\Windows\System32\sethc.exe
echo.
echo.
echo  ---------------------------------------------------------------
rem echo  Для вызова консоли нажать клавиши [WIN] [+] (Magnify.exe)
echo  Настройка консоли для локального входа выполнена успешно.
echo  Для вызова консоли нажать клавиши левый [ALT] [SHIFT] [PrtScrn]
echo  ---------------------------------------------------------------
echo.
pause
goto x00

:x4
cls
echo.
echo ------------------------------------------
echo "Завершение процесса"
TASKKILL /F /IM sethc.exe /T
echo.
echo "Смена владельца файла в Windows"
echo.
rem takeown /A /F "C:\Windows\System32\Magnify.exe"
takeown /A /F "C:\Windows\System32\sethc.exe"
echo.
echo ------------------------------------------
echo "Установка прав доступа"
icacls C:\Windows\System32\sethc.exe /grant Администраторы:F
echo.
echo -------------------------------------------
echo "Восстановление файла"
xcopy /F /H /R /Y C:\Windows\System32\sethc.exe.bak C:\Windows\System32\sethc.exe
echo.
echo.
echo  ---------------------------------------
echo  Восстановление файла выполнено успешно.
echo  ---------------------------------------
echo.
pause
goto x00

:x5
cls
echo.
echo "Очистка следов \FarManager"
REG DELETE "HKCU\Software\Far Manager" /f
REG DELETE HKCU\Software\7-ZIP /f
C:
rd /s /q %USERPROFILE%\"Local Settings\Far Manager"
echo.
echo -------------------------
echo "Очистка следов \FarManager" выполнено.
echo.
pause
goto x0

:x6
cls
echo.
echo  ----------------------------------------
echo  Удаленная перезагрузка ПК (в домене)
echo  ----------------------------------------
echo.
SET /P VSP=" Введите номер ГРУППЫ: "

if /i '%VSP%'=='0001' goto x0001
if /i '%VSP%'=='0365' goto x0002
if /i '%VSP%'=='0368' goto x0003
if /i '%VSP%'=='0' goto x0

:x0001
echo.
echo Выполняется удаленная перезагрузка ПК в ГРУППЕ AAA\%VSP%
echo.
start ping -a -t 192.168.0.101
net use \\192.168.0.101\c$ /user:Administrator 12345678
shutdown -r -f -t 5 -m \\192.168.0.101
pause
goto x0

:x0002
echo.
echo Выполняется удаленная перезагрузка ПК в ГРУППЕ BBB\%VSP%
@echo off
chcp 1251
:x00
cls
echo.
echo  --------------------------
echo      ARM_SpecSettings
echo  --------------------------
echo  1 - Включить USB 
echo  2 - Отключить USB
echo  3 - Локальный вход
echo  4 - Откат (Локальный вход)
echo  5 - Очистка Far
echo  6 - Валютное Табло
echo  7 - Сетевые настройки SBCORP
echo  0 - Выход         
echo  --------------------------
echo.
SET /P N=" Введите номер: "

if /i '%N%'=='1' goto x1
if /i '%N%'=='2' goto x2
if /i '%N%'=='3' goto x3
if /i '%N%'=='4' goto x4
if /i '%N%'=='5' goto x5
if /i '%N%'=='6' goto x6
if /i '%N%'=='7' goto x7
if /i '%N%'=='0' goto x0
:x1
cls
echo.
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR /v Start /t REG_DWORD /d 00000003 /f
rem REG ADD HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR /v Start /t REG_DWORD /d 00000004 /f
echo.
echo  ------------
echo  USB включено 
echo  ------------
echo.
pause
goto x0

:x2
cls
echo.
rem REG ADD HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR /v Start /t REG_DWORD /d 00000003 /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR /v Start /t REG_DWORD /d 00000004 /f
echo.
echo  ------------
echo  USB отключено 
echo  ------------
echo.
pause
goto x0

:x3
cls
echo.
echo ------------------------------------------
echo "Завершение процесса"
TASKKILL /F /IM sethc.exe /T
echo.
echo "Смена владельца файла в Windows"
echo.
takeown /A /F "C:\Windows\System32\sethc.exe"
echo.
echo ------------------------------------------
echo "Установка прав доступа"
icacls C:\Windows\System32\sethc.exe /grant Администраторы:F

echo.
echo ------------------------------------------
echo "Резервирование файла"
copy /Y C:\Windows\System32\sethc.exe C:\Windows\System32\sethc.exe.bak

echo.
echo -------------------------------------------
echo "Переименование файла"
xcopy /F /H /R /Y C:\Windows\System32\cmd.exe C:\Windows\System32\sethc.exe
echo.
echo.
echo  ---------------------------------------------------------------
rem echo  Для вызова консоли нажать клавиши [WIN] [+] (Magnify.exe)
echo  Настройка консоли для локального входа выполнена успешно.
echo  Для вызова консоли нажать клавиши левый [ALT] [SHIFT] [PrtScrn]
echo  ---------------------------------------------------------------
echo.
pause
goto x00

:x4
cls
echo.
echo ------------------------------------------
echo "Завершение процесса"
TASKKILL /F /IM sethc.exe /T
echo.
echo "Смена владельца файла в Windows"
echo.
rem takeown /A /F "C:\Windows\System32\Magnify.exe"
takeown /A /F "C:\Windows\System32\sethc.exe"
echo.
echo ------------------------------------------
echo "Установка прав доступа"
icacls C:\Windows\System32\sethc.exe /grant Администраторы:F
echo.
echo -------------------------------------------
echo "Восстановление файла"
xcopy /F /H /R /Y C:\Windows\System32\sethc.exe.bak C:\Windows\System32\sethc.exe
echo.
echo.
echo  ---------------------------------------
echo  Восстановление файла выполнено успешно.
echo  ---------------------------------------
echo.
pause
goto x00

:x5
cls
echo.
echo "Очистка следов \FarManager"
REG DELETE "HKCU\Software\Far Manager" /f
REG DELETE HKCU\Software\7-ZIP /f
C:
rd /s /q %USERPROFILE%\"Local Settings\Far Manager"
echo.
echo -------------------------
echo "Очистка следов \FarManager" выполнено.
echo.
pause
goto x0

:x6
cls
echo.
echo  ----------------------------------------
echo  Удаленная перезагрузка ПК (в домене)
echo  ----------------------------------------
echo.
SET /P VSP=" Введите номер ГРУППЫ: "

if /i '%VSP%'=='0001' goto x0001
if /i '%VSP%'=='0365' goto x0002
if /i '%VSP%'=='0368' goto x0003
if /i '%VSP%'=='0' goto x0

:x0001
echo.
echo Выполняется удаленная перезагрузка ПК в ГРУППЕ AAA\%VSP%
echo.
start ping -a -t 192.168.0.101
net use \\192.168.0.101\c$ /user:Administrator 12345678
shutdown -r -f -t 5 -m \\192.168.0.101
pause
goto x0

:x0002
echo.
echo Выполняется удаленная перезагрузка ПК в ГРУППЕ BBB\%VSP%
echo.
start ping -a -t 192.168.0.102
net use \\192.168.0.102\c$ /user:Administrator 12345678
shutdown -r -f -t 5 -m \\192.168.0.102
pause
goto x0

:x0368
echo.
echo Выполняется удаленная перезагрузка ПК в ГРУППЕ 000\%VSP%
echo.
start ping -a -t 192.168.0.103
net use \\192.168.0.103\c$ /user:Administrator 12345678
shutdown -r -f -t 5 -m \\192.168.0.103
pause
goto x0


:x7
cls
echo.
echo -------------------------------------
echo Установка сетевых настроек ПК
echo -------------------------------------
echo.
set /p nm=" Имя компьютера: "
set /p ip=" Введите IP: "
if "%ip%" == "0" (goto x03)
set /p msk=" Введите маску: "
if "%msk%" == "0" (goto x03)
set /p gtw=" Введите шлюз: "
if "%gtw%" == "0" (goto x03)
if "%nm%" == "0" (goto x02) else (goto x01)
echo.
echo -------------------------------------
:x01
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ActiveComputerName /v ComputerName /t REG_SZ /d "%nm%" /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName /v ComputerName /t REG_SZ /d "%nm%" /f
REG ADD HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters /v "NV Hostname" /t REG_SZ /d "%nm%" /f
:x02
netsh interface ip set address name="Подключение по локальной сети" source=static addr=%ip% mask=%msk% gateway=%gtw%
netsh interface ip set dns "Подключение по локальной сети" static 192.168.0.100
netsh interface ip add dns "Подключение по локальной сети" 192.168.1.101
netsh interface ip add dns "Подключение по локальной сети" 192.168.1.102
netsh interface ip add dns "Подключение по локальной сети" 192.168.1.103
echo.
:x03
ipconfig /all
pause

:x0
exit
```
