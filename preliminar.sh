#!/bin/bash
# Script para las actividades preliminares del Sistema Operativo
clear
echo "**********************************************************"
echo "Script para cambiar el publicador e instalar el escritorio"
echo "**********************************************************"
cd
### Alias para el .profile
echo alias "c=clear" >> .profile
echo alias "ll='ls -lah'" >> .profile
echo alias "dh='df -h'" >> .profile
echo alias "zl='zoneadm list -cv'" >> .profile
### Alias para el .bashrc
echo alias "c=clear" >> .bashrc
echo alias "ll='ls -lah'" >> .bashrc
echo alias "dh='df -h'" >> .bashrc
echo alias "zl='zoneadm list -cv'" >> .bashrc
pkg set-publisher -G"*" -g http://192.168.254.2:9999 solaris
pkg install solaris-desktop
reboot
