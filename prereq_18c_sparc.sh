#!/bin/bash
############################################################################
### Script de configuracion para instalacion de Base de Datos Oracle 18c ###
############################################################################
#
### Instalación de Paquetes
echo Instalando Paquetes
pkg install SUNWhea
pkg install pkg://solaris/compatibility/packages/SUNWxwplt
pkg install make
pkg install assembler
pkg install x11-info-clients
pkg install jre-8 jdk-8
pkg install top
### Creacion de usuario y grupos
echo Creando grupos y usuario oracle
groupadd oinstall
groupadd dba
useradd -m -d /export/home/oracle -s /bin/bash -g oinstall -G dba oracle
passwd oracle
### Creación de proyecto para modificacion de parametros de Kernel
echo Creando proyecto y configurando variables de kernel
projadd -p 100 -U oracle -G oinstall user.oracle
projmod -sK "project.max-shm-memory=(priv,8G,deny)" user.oracle
projmod -sK "process.max-file-descriptor=(priv,65536,deny)" user.oracle
projmod -sK "process.max-sem-nsem=(priv,256,deny)" user.oracle
projmod -sK "project.max-sem-ids=(priv,128,deny)" user.oracle
projmod -sK "project.max-shm-ids=(priv,128,deny)" user.oracle
### Cambio de parametros tcp y udp
echo Configurando parametros de red
ipadm set-prop -p smallest_anon_port=9000 tcp
ipadm set-prop -p smallest_anon_port=9000 udp
### Creacion de directorios
echo Creando directorios
mkdir -p /u01/app/oracle/product/18c/dbhome
mkdir /u01/app/oraInventory
## Copia de SW, descompresión y cambio de permisos
echo Copiando SW a dbhome, descomprimiento y cambiando permisos
cp SOLARIS.SPARC64_180000_db_home.zip /u01/app/oracle/product/18c/dbhome
cd /u01/app/oracle/product/18c/dbhome/
unzip SOLARIS.SPARC64_180000_db_home.zip
cd
chown -R oracle:oinstall /u01
chmod -R 755 /u01
echo Borrando el archivo de instalacion del dbhome
rm /u01/app/oracle/product/18c/dbhome/SOLARIS.SPARC64_180000_db_home.zip
echo No olvidar correr el script de variables de ambiente como user oracle
