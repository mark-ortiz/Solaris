#!/bin/bash
clear
echo "*****************************************************"
echo "* Script para las variables de ambiente del usuario *"
echo "* 		oracle                            *"
echo "*****************************************************"
chmod 744 .bashrc
### Configuracion de alias
echo "alias c=clear" >> .profile
echo "alias ll='ls -lah'" >> .profile
echo "alias dh='df -h'" >> .profile
echo "alias c=clear" >> .bashrc
echo "alias ll='ls -lah'" >> .bashrc
echo "alias dh='df -h'" >> .bashrc
### Configuración de las variables de ambiente del usuario oracle ###
echo export TEMP=/tmp >> .profile
echo export TEMPDIR=$TEMP >> .profile
echo export ORACLE_UNQNAME=orcl >> .profile
echo export ORACLE_BASE=/u01/app/oracle >> .profile
echo "export ORACLE_HOME=$ORACLE_BASE/product/12c/dbhome" >> .profile
echo export ORACLE_SID=orcl >> .profile
echo export PATH=$PATH:$ORACLE_HOME/bin >> .profile
echo export JAVA_HOME=/usr/jdk/jdk1.8.0_60 >> .profile
echo export DISPLAY=:0.0 >> .profile
### Configuracion de las variables en .bashrc
echo export TEMP=/tmp >> .bashrc
echo export TEMPDIR=$TEMP >> .bashrc
echo export ORACLE_UNQNAME=orcl >> .bashrc
echo export ORACLE_BASE=/u01/app/oracle >> .bashrc
echo export ORACLE_HOME=$ORACLE_BASE/product/12c/dbhome >> .bashrc
echo export ORACLE_SID=orcl >> .bashrc
echo export PATH=$PATH:$ORACLE_HOME/bin >> .bashrc
echo export JAVA_HOME=/usr/jdk/jdk1.8.0_60 >> .bashrc
echo export DISPLAY=:0.0 >> .bashrc
