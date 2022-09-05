# INSTRUCCIONES 

1 - Instalar Vagrant y Virtualbox (se puede hacer desde /lab_setup/descargaVagrantVbox.bat).

2 - Comprobar el adaptador de red Virtualbox o el que se use (en mi caso es "Realtek PCIe 2.5GbE Family Controller").
3 - Cambiarlo donde indica los adaptadores
               - /lab_setup/limpiar.cmd
               - /lab_setup/setup.cmd
               - Vagrantfile (los adaptadores de cada maquina)

4 - Cuando se ha cambiado ejecutar limpiar y luego setup.

5 - IMPORTANTE: Se debe modificar "iniciar_bots.bat" linea 25 con el disco donde se ubique la instalación de Vbox. Con VBoxManage se modifica el adaptardor para cerrarlo a la red.
Este archivo se encuentra en la carpeta donde se ha instalado Vbox.

6 - Ejecutar iniciar.bat.

7 - Cuando haya terminado de instalarse comprobar que el adaptador de red de los bots ha quedado como "no conectado".

8 - Finalmente /scripts/start.bat para iniciar el cnc y cargar el malware.

# Mirai botnet

Mirai es un malware cuyo destino es infectar dispositivos IoT (Internet de las cosas) mediante el uso de las credenciales por defecto que muchos de estos dispositivos emplean, y que no son modificadas, lo cual es un problema importante de seguridad. El objetivo principal de este malware es emplear estos dispositivos infectados para realizar ataques DDoS.


El bot y los programas relacionados fueron creados por Anna-senpai, descubiertos por primera vez e investigado por MalwareMustDie a finales de agosto de 2016. 

Ver "ForumPost.txt" o [ForumPost.md](ForumPost.md) para el post en el que se se filtra, si quieres saber como esta todo montado.

Este repositorio contiene todo el código fuente, configuraciones y scripts necesarios para repetir los experimentos.

  * [Mirai botnet](Texto vinculado pendiente)
  * [Realización de un ataque](Texto vinculado pendiente)

  ## Requisitos
* gcc
* golang
* electric-fence
* mysql-server
* mysql-client

## Credits
[Anna-senpai](https://hackforums.net/showthread.php?tid=5420472)

## Disclaimer
Este repositorio es para fines académicos, el uso de este software es su responsabilidad.

## Warning
El archivo zip de este repositorio ha sido identificado por algunos programas AV como malware. Por favor, tenga cuidado.

<h1 align="center">Estudio, despliegue y modificación de la Botnet Mirai - Botnet DDoS Ataques disponibles</h1>
<em><h5 align="center">(Lenguaje de programación - C and Go )</h5></em>

<p align="center">
  
<p align="center">Por favor, no ataques sitios web sin el consentimiento de los propietarios.</p>

## Características y métodos

 * 💣 Capa 7

   * HTTP | HTTP Flood
   * <img src="https://img.icons8.com/plasticine/2x/null-symbol.png" width="16" height="16" alt="null"> NULL | Null UserAgent and ...
   * <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1024px-Google_%22G%22_Logo.svg.png" width="16" height="16" alt="Google bot"> BOT | Like Google bot
   * <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Apache_HTTP_Server_Logo_%282016%29.svg/1000px-Apache_HTTP_Server_Logo_%282016%29.svg.png" width="16" height="16" alt="Apache Webserver"> APACHE | Apache Expliot
   * <img src="https://icon-library.com/images/icon-for-wordpress/icon-for-wordpress-16.jpg" width="16" height="16" alt="wordpress expliot"> XMLRPC | WP XMLRPC expliot (add /xmlrpc.php)



* 🧨 Capa 4: 
  * TCP | TCP Flood 
  * UDP | UDP Flood 
  * SYN | SYN Flood
  * GREIP | GRE IP Flood
  * ACK | ACK Flood
  * GREETH | GRE Ethernet Flood
  * <img src="https://ia803109.us.archive.org/27/items/source-engine-video-projects/source-engine-video-projects_itemimage.png" width="16" height="16" alt="vse"> VSE | Valve Source Engine specific flood
  * DNS | DNS Resolver Flood
  * UDPPLAIN | UDP Flood optimized for PPS

* ⚙️ Tools - Scripts del lab
`
Texto
`
  * 
  *
  *  


### Cómo empezar

---

**Script de clonación e instalación**

```shell script
git clone https://github.com/MarioAdanH/Mirai-Lab-TFG.git
cd Mirai-Lab-TFG


```

[github]: https://github.com/MarioAdanH 'GitHub'

