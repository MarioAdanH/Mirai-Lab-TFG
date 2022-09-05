@ECHO OFF

ECHO ------------------------------------------------------------------------------------------------------------------------

ECHO Si es la primera ejecucion, en primer lugar revise los requisitos y asegurese que está todo configurado a su entorno.

ECHO Es necesario introducir manualmente su adaptador de red en Vagrantfile y en la carpeta /lab_setup.

ECHO En este script se unifica el lanzamiento de maquinas.

ECHO Puede hacerlo manualmente ejecutando iniciar_mirai y iniciar_bots (por defecto 2 bots)

ECHO Tambien se pueden encontrar scripts que pueden ser utiles si se realizan cambios en el programa.

ECHO Iniciando... 

ECHO ------------------------------------------------------------------------------------------------------------------------

ECHO Creando maquina principal... 
call ".\scripts\iniciar_mirai.bat"


ECHO Creando bots...
call ".\scripts\iniciar_bots.bat"


PAUSE
