#!/bin/bash
function hd {
clear;hostname;date
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
hd;cmd "df -h";espera
totfs=$(df -h|wc -l);totfs=$((totfs-2))
array1=($(df -h|grep -v Capacity|awk '{print $5}'))
array2=($(df -h|grep -v Mounted|awk '{print $6}'))
clear
for ((i=0; i<=totfs; i++))
do
   echo FS ROW $((i+1)): ${array1[$i]}, ${array2[$i]}
done
espera
clear
echo Va el segundo for
echo
for ((i=0; i<=totfs; i++))
do
   aux=${array1[$i]%\%}
   array3[$i]=$((aux))
   echo ${array3[$i]}
   aux2=${array3[$i]}
   if [ $((aux2)) -gt 15 ]
   then
     echo Es mayor a 15
   fi
done
