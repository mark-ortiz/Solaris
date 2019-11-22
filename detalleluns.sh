#!/bin/bash
clear
echo
totluns=$(stmfadm list-lu|wc -l)
echo -e "\e[4;93mDetalle de LUNs (Vistas)\e[0m"
echo
echo Total de LUNs en el sistema: $totluns
echo
array=($(stmfadm list-lu|awk '{print $3}'))
totluns=$((totluns-1))
for ((i=0; i<= $totluns; i++))
do
echo LUN $((i+1)): ${array[$i]}
stmfadm list-view -l ${array[$i]}
echo
done 
