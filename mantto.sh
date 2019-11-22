#!/bin/bash
#############################################################################
##### ---> SCRIPT PARA AYUDAR EN LA AUTOMATIZACION DE MANTENIMIENTOS <--- ###
#####       ELABORADO POR ING. MARCO ANTONIO ORTIZ MENESES                ###
#####                      MAYO 2018                                      ###
#############################################################################
function hd {
clear;cmd hostname;cmd date
}
function espera {
read -s -n 1 key
}
prompt="$LOGNAME@$HOSTNAME #"
function cmd {
echo $prompt $1
$1
}
clear
echo
echo
echo -e "\e[1;4;93mFIJATE LO QUE HACES Y HAZLO RAPIDO NO ESTES PERDIENDO EL TIEMPO"
echo
echo -e "ANALIZA NO SOLO EJECUTES COMO ZOMBIE ---  NO TODO APLICA"
echo
echo -e "Presiona cualquier tecla para continuar despues de cada pantalla\e[0m"
espera
#######################################
### PREPARACION PARA CALCULOS DE FS ###
#######################################
totfs=$(df -h|wc -l);totfs=$((totfs-2))
array1=($(df -h|grep -v Capacity|awk '{print $5}'))
array2=($(df -h|grep -v Mounted|awk '{print $6}'))
totpools=$(zpool list|wc -l);totpools=$((totpools-1))
array3=($(zpool list|grep -v NAME|awk '{print $1}'))
array4=($(zpool list|grep -v CAP |awk '{print $5}'))
#######################################
#### Cuerpo de ejecución del script ###
#######################################
hd;cmd "pkg info entire";espera
hd;cmd "ipadm";espera
hd;cmd "ipmpstat -g";espera
hd;cmd "uptime";espera
hd;echo $prompt last \| grep boot;last|grep boot;espera
hd;cmd "df -h";espera
echo;echo Probando File Systems
for ((i=0; i<=totfs; i++))
do
#   echo FS ROW $((i+1)): ${array1[$i]}, ${array2[$i]}
   aux=${array1[$i]%\%}
   array1[$i]=$((aux))
   if [ ${array1[$i]} -gt 75 ]
   then
      echo -e "\e[1;4;93mTienes un problema con el FS ${array2[$i]}, es de ${array1[$i]}\% y es mayor a 75\%\e[0m"
   fi
done
espera 
hd;cmd "zpool status rpool";espera
hd;cmd "zpool list";espera
echo;echo Probando pooles
for ((i=0; i<=totpools; i++))
do
   aux=${array4[$i]%\%}
   array4[$i]=$((aux))
   if [ ${array4[$i]} -gt 75 ]
   then
      echo -e "\e[1;4;93mTienes un problema con el POOL ${array3[$i]}, es de ${array4[$i]}\% y es mayor a 75\%\e[0m"
   fi
done
espera
hd;cmd "zpool status -xv";espera
hd;cmd "iostat -En";espera
hd;cmd "svcs -xv";espera
hd;cmd "ldm ls";espera
hd;cmd "format";espera
hd;cmd "top"
hd;cmd "prstat -a";espera
hd;cmd "sar -r 2 4";espera
hd;cmd "sar 1 10";espera
hd;cmd "zoneadm list -cv";espera
hd;cmd "zonestat 2 6";espera
hd;cmd "fmadm config";espera
hd;cmd "fmadm faulty";espera
hd;cmd "prtdiag";espera
