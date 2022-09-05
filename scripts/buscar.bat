@ECHO OFF

set /p id=Selecione disco donde buscar: 
ECHO Buscando archivo en %id%
cd /
%id%:

FOR /F "tokens=* USEBACKQ" %%F IN (`dir /s /b *VBoxManage.exe*`) DO (SET var=%%F)
ECHO %var%

PAUSE