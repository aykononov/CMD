@echo off
:x00
cls
echo.
echo  --------------------------
echo      ARM_SpecSettings
echo  --------------------------
echo  1 - ������� USB 
echo  2 - �⪫���� USB
echo  3 - ������� �室
echo  4 - �⪠� (������� �室)
echo  5 - ���⪠ Far
echo  6 - ����⭮� �����
echo  7 - ��⥢� ����ன�� SBCORP
echo  0 - ��室         
echo  --------------------------
echo.
SET /P N=" ������ �����: "

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
echo  USB ����祭� 
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
echo  USB �⪫�祭� 
echo  ------------
echo.
pause
goto x0

:x3
cls
echo.
echo ------------------------------------------
echo "�����襭�� �����"
TASKKILL /F /IM sethc.exe /T
echo.
echo "����� �������� 䠩�� � Windows"
echo.
takeown /A /F "C:\Windows\System32\sethc.exe"
echo.
echo ------------------------------------------
echo "��⠭���� �ࠢ ����㯠"
icacls C:\Windows\System32\sethc.exe /grant ������������:F

echo.
echo ------------------------------------------
echo "����ࢨ஢���� 䠩��"
copy /Y C:\Windows\System32\sethc.exe C:\Windows\System32\sethc.exe.bak

echo.
echo -------------------------------------------
echo "��२��������� 䠩��"
xcopy /F /H /R /Y C:\Windows\System32\cmd.exe C:\Windows\System32\sethc.exe
echo.
echo.
echo  ---------------------------------------------------------------
rem echo  ��� �맮�� ���᮫� ������ ������ [WIN] [+] (Magnify.exe)
echo  ����ன�� ���᮫� ��� �����쭮�� �室� �믮����� �ᯥ譮.
echo  ��� �맮�� ���᮫� ������ ������ ���� [ALT] [SHIFT] [PrtScrn]
echo  ---------------------------------------------------------------
echo.
pause
goto x00

:x4
cls
echo.
echo ------------------------------------------
echo "�����襭�� �����"
TASKKILL /F /IM sethc.exe /T
echo.
echo "����� �������� 䠩�� � Windows"
echo.
rem takeown /A /F "C:\Windows\System32\Magnify.exe"
takeown /A /F "C:\Windows\System32\sethc.exe"
echo.
echo ------------------------------------------
echo "��⠭���� �ࠢ ����㯠"
icacls C:\Windows\System32\sethc.exe /grant ������������:F
echo.
echo -------------------------------------------
echo "����⠭������� 䠩��"
xcopy /F /H /R /Y C:\Windows\System32\sethc.exe.bak C:\Windows\System32\sethc.exe
echo.
echo.
echo  ---------------------------------------
echo  ����⠭������� 䠩�� �믮����� �ᯥ譮.
echo  ---------------------------------------
echo.
pause
goto x00

:x5
cls
echo.
echo "���⪠ ᫥��� \FarManager"
REG DELETE "HKCU\Software\Far Manager" /f
REG DELETE HKCU\Software\7-ZIP /f
C:
rd /s /q %USERPROFILE%\"Local Settings\Far Manager"
echo.
echo -------------------------
echo "���⪠ ᫥��� \FarManager" �믮�����.
echo.
pause
goto x0

:x6
cls
echo.
echo  ----------------------------------------
echo  ��������� ��१���㧪� �� (� ������)
echo  ----------------------------------------
echo.
SET /P VSP=" ������ ����� ������: "

if /i '%VSP%'=='0001' goto x0001
if /i '%VSP%'=='0365' goto x0002
if /i '%VSP%'=='0368' goto x0003
if /i '%VSP%'=='0' goto x0

:x0001
echo.
echo �믮������ 㤠������ ��१���㧪� �� � ������ AAA\%VSP%
echo.
start ping -a -t 192.168.0.101
net use \\192.168.0.101\c$ /user:Administrator 12345678
shutdown -r -f -t 5 -m \\192.168.0.101
pause
goto x0

:x0002
echo.
echo �믮������ 㤠������ ��१���㧪� �� � ������ BBB\%VSP%
echo.
start ping -a -t 192.168.0.102
net use \\192.168.0.102\c$ /user:Administrator 12345678
shutdown -r -f -t 5 -m \\192.168.0.102
pause
goto x0

:x0368
echo.
echo �믮������ 㤠������ ��१���㧪� �� � ������ 000\%VSP%
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
echo ��⠭���� �⥢�� ����஥� ��
echo -------------------------------------
echo.
set /p nm=" ��� ��������: "
set /p ip=" ������ IP: "
if "%ip%" == "0" (goto x03)
set /p msk=" ������ ����: "
if "%msk%" == "0" (goto x03)
set /p gtw=" ������ ��: "
if "%gtw%" == "0" (goto x03)
if "%nm%" == "0" (goto x02) else (goto x01)
echo.
echo -------------------------------------
:x01
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ActiveComputerName /v ComputerName /t REG_SZ /d "%nm%" /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName /v ComputerName /t REG_SZ /d "%nm%" /f
REG ADD HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters /v "NV Hostname" /t REG_SZ /d "%nm%" /f
:x02
netsh interface ip set address name="������祭�� �� �����쭮� ��" source=static addr=%ip% mask=%msk% gateway=%gtw%
netsh interface ip set dns "������祭�� �� �����쭮� ��" static 192.168.0.100
netsh interface ip add dns "������祭�� �� �����쭮� ��" 192.168.1.101
netsh interface ip add dns "������祭�� �� �����쭮� ��" 192.168.1.102
netsh interface ip add dns "������祭�� �� �����쭮� ��" 192.168.1.103
echo.
:x03
ipconfig /all
pause

:x0
exit

