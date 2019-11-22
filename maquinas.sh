#!/bin/bash
clear
echo
echo -e "\e[4;93mMaquinas virtuales definidas en el sistema\e[0m"
echo
VBoxManage list vms
echo
echo -e "\e[4;93mMaquinas virtuales que estan corriendo\e[0m"
echo
VBoxManage list runningvms
echo
echo -e "\e[4;93mUso de Memoria\e[0m"
echo ::memstat|mdb -k
