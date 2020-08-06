@echo off
chcp 1251
rem Как активировать Windows 10
rem 1. Введите команду: slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX , нажмите клавишу Enter.
rem 2. Теперь введите вторую команду и нажмите Enter: slmgr /skms kms.xspace.in
rem Опять ждем для окно сообщения.
rem 3. Наконец введите команду: slmgr /ato Нажимаем клавишу ВВОД, активируется сборка Windows 10

echo "Полная информация о лицензии."
slmgr /dlv

echo "Windows 10 Enterprise 1909"
rem start /wait slmgr /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43
rem start /wait slmgr /skms kms.xspace.in 
rem start /wait slmgr /ato
