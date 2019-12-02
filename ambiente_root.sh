#!/bin/bash
echo "*****************************************************"
echo "* Script para instalación de paquetes y creacion de *"
echo "* 	usuarios y grupos y proyecto              *"
echo "*****************************************************"
###
### Instalación de paquetes prerrequisitos ###
pkg install SUNWhea
pkg install pkg://solaris/compatibility/packages/SUNWxwplt
zfs set volsize=13G rpool/swap
###
### Creación de grupos y usuarios ###
groupadd oinstall
groupadd dba
useradd -m -d /export/home/oracle -s /bin/bash -g oinstall -G dba oracle
passwd oracle
### Creación de directorios y cambio de permisos ###
mkdir -p /u01/app/oracle/product/12c/dbhome
mkdir /u01/app/oraInventory
chown -R oracle:oinstall /u01
chmod -R 775 /u01
### Creacion de proyecto y configuración de parametros de kernel ###
projadd -p 100 -U oracle -G oinstall user.oracle
projmod -sK "project.max-shm-memory=(priv,4G,deny)" user.oracle
projmod -sK "process.max-file-descriptor=(priv,65536,deny)" user.oracle
projmod -sK "process.max-sem-nsems=(priv,256,deny)" user.oracle
projmod -sK "project.max-sem-ids=(priv,128,deny)" user.oracle
projmod -sK "project.max-shm-ids=(priv,128,deny)" user.oracle
### Modificación de parametros de red ###
ipadm set-prop -p smallest_anon_port=9000 tcp
ipadm set-prop -p smallest_anon_port=9000 udp
### Permitir la salida del server X
xhost +

