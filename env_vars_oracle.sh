#!/bin/bash
### Script para configurar las variables de ambiente para Base de DAtos 18c
cp .profile .profile.original
echo '### Variables de ambiente para DB ###' >> .profile
echo 'export TEMP=/tmp' >> .profile 
echo 'export TEMPDIR=$TEMP' >> .profile
echo 'export ORACLE_UNQNAME=orcl' >> .profile
echo 'export ORACLE_BASE=/u01/app/oracle' >> .profile
echo 'export ORACLE_HOME=$ORACLE_BASE/product/18c/dbhome' >> .profile
echo 'export ORACLE_SID=orcl' >> .profile
echo 'export PATH=$PATH:$ORACLE_HOME/bin:/u01/middleware/bin' >> .profile
echo 'export JAVA_HOME=/usr/jdk/instances/jdk1.8.0' >> .profile
echo 'export DISPLAY=192.168.254.254:0.0' >> .profile  ## MODIFICAR POR TU IP
## Añadiendo tambien al bashrc
chmod 755 .bashrc
cp .bashrc .bashrc.original
echo '### Variables de ambiente para DB ###' >> .bashrc
echo 'export TEMP=/tmp' >> .bashrc
echo 'export TEMPDIR=$TEMP' >> .bashrc
echo 'export ORACLE_UNQNAME=orcl' >> .bashrc
echo 'export ORACLE_BASE=/u01/app/oracle' >> .bashrc
echo 'export ORACLE_HOME=$ORACLE_BASE/product/18c/dbhome' >> .bashrc
echo 'export ORACLE_SID=orcl' >> .bashrc
echo 'export PATH=$PATH:$ORACLE_HOME/bin:/u01/middleware/bin' >> .bashrc
echo 'export JAVA_HOME=/usr/jdk/instances/jdk1.8.0' >> .bashrc
echo 'export DISPLAY=192.168.254.254:0.0' >> .bashrc  ## MODIFICAR POR TU IP

