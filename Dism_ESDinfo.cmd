@echo off
chcp 1251
cls
rem dism /get-wiminfo /wimfile:"E:\sources\install.esd"
dism /get-wiminfo /wimfile:"%cd%\18363.418.191007-0143.19h2_release_svc_refresh_CLIENTBUSINESS_VOL_x64FRE_ru-ru.esd"
pause