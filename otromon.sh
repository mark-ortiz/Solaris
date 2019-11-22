#!/bin/bash
clear
echo
echo Cuants veces quieres que se repita el monitoreo
read itera
count="0"
while [$itera < $count]
do
clear
echo
echo -e "\e[4;93mMonitoreo de Memoria\e[0m"
echo
echo ::memstat|mdb -k
echo
echo -e "\e[4;93mMonitoreo de Discos y Pooles\e[0m"
echo
zpool iostat 1 1
echo
iostat -cxn
sleep 10
let count=count+1
let itera=itera-1
done
