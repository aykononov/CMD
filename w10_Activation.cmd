@echo off
chcp 1251
rem ��� ������������ Windows 10
rem 1. ������� �������: slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX , ������� ������� Enter.
rem 2. ������ ������� ������ ������� � ������� Enter: slmgr /skms kms.xspace.in
rem ����� ���� ��� ���� ���������.
rem 3. ������� ������� �������: slmgr /ato �������� ������� ����, ������������ ������ Windows 10

echo "������ ���������� � ��������."
slmgr /dlv

echo "Windows 10 Enterprise 1909"
rem start /wait slmgr /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43
rem start /wait slmgr /skms kms.xspace.in 
rem start /wait slmgr /ato
