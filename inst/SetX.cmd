
setx -m ORACLE_HOME "C:\oracle\client\12.1.0"
setx -m NLS_DATE_FORMAT "DD.MM.YYYY HH24:MI:SS"
setx -m NLS_LANG "RUSSIAN_RUSSIA.CL8MSWIN1251"
setx -m JAVA_HOME "C:\Program Files (x86)\Java\jdk1.8.0_241"
setx -m JRE_HOME "C:\Program Files (x86)\Java\jre1.8.0_241"

setx -m path "%ORACLE_HOME%\bin;%JAVA_HOME%\bin;%JRE_HOME%\bin;C:\Program Files\Git\cmd;%SystemRoot%\system32;%SystemRoot%;C:\Program Files\Far\Plugins\FarDroid\platform-tools"

rem setx -m path "%ORACLE_HOME%\bin;%JAVA_HOME%\bin;%path%"
rem setx -m M2_HOME "C:\apache-maven-3.6.3"
rem setx -m CLASSPATH "C:\oracle\client\12.1.0\jdbc\lib\ojdbc8.jar"
rem setx -m TNS_ADMIN "C:\oracle\instantclient_19_5\TNS"

