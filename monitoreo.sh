#!/bin/bash
#while true
#do
clear
echo
echo -e "\e[4;93mMonitoreo de Memoria\e[0m"
echo
echo ::memstat|mdb -k
echo
echo -e "\e[4;93mMonitoreo de Pooles\e[0m"
echo
zpool list
echo
zpool iostat -v
echo
iostat -cxnz
#sleep 10
#done
