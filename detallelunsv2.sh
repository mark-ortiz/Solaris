#!/bin/bash
clear
echo
totluns=$(stmfadm list-lu|wc -l)
echo -e "\e[4;93mDetalle de LUNs (Vistas)\e[0m"
echo
echo Total de LUNs en el sistema: $totluns
echo
arrayluns=($(stmfadm list-lu|awk '{print $3}'))
arraysize=($(stmfadm list-lu -v |grep Size|grep -v Block|awk '{print $3}'))
datafile=($(stmfadm list-lu -v |grep Data|awk '{print $4}'))
totluns=$((totluns-1))
for ((i=0; i<= $totluns; i++))
do
   echo LUN $((i+1)): ${arrayluns[$i]}
   arraysize[$i]=$((arraysize[$i]/1024/1024/1024))
   echo Tamaño: ${arraysize[$i]} GB
   echo Data File: ${datafile[$i]}
   stmfadm list-view -l ${arrayluns[$i]}
   echo
done 
