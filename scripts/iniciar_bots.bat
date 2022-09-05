@ECHO OFF

set /p num=Selecione numero de bots que desea crear: 

REM Por si se ejecuta directamente el archivo, por defecto se crean 2 bots IF %num% EQU 0 (SET num=2) 

ECHO %num%| findstr /r "^[1-9][0-9]*$">nul

REM Comprobamos entrada de usuario
IF %errorlevel% equ 0 (
    ECHO Creando %num% bots VMs ...
)ELSE IF %num% EQU -1 (
	GOTO :end
)ELSE (
	ECHO No valido, debe ser un numero entero
	GOTO :start
)

ECHO Building bots VMs (%num%)...

FOR /L %%i IN (1,1,%num%) DO vagrant up bot_%%i

ECHO Cerrando NAT de los bots(interfaz de red 1)
REM Disco donde esta instalado Virtualbox para cambiar la configuracion con VBoxManage
c: 
FOR /F "tokens=* USEBACKQ" %%F IN (`dir /s /b *VBoxManage.exe*`) DO (SET var=%%F)
ECHO %var%

FOR /L %%j IN (1,1,%num%) DO "%var%" controlvm bot_%%j nic1 null

PAUSE
