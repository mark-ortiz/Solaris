#!/usr/bin/bash
clear

echo -e "\e[36m ####################################################### "
echo -e "\e[36m ##\e[0m   \e[32m Este es un script de monitoreo de temperatura \e[0m \e[36m ##"
echo -e "\e[36m #######################################################\e[0m"

echo -e "\e[31m         #####   ##### \e[0m \e[39m ######## \e[0m \e[32m ####    ### \e[0m"
echo -e "\e[31m         #### # # #### \e[0m \e[39m ###  ### \e[0m \e[32m ### #   ### \e[0m"
echo -e "\e[31m         ####  #  #### \e[0m \e[39m ###  ### \e[0m \e[32m ###  #  ### \e[0m"
echo -e "\e[31m         ####     #### \e[0m \e[39m ###  ### \e[0m \e[32m ###   # ### \e[0m"
echo -e "\e[31m         ####     #### \e[0m \e[39m ######## \e[0m \e[32m ###    #### \e[0m itoreo."

echo
echo " Este escript es ejecutado por cuestiones de monitoreo"   #Este escript al ejecutarse manda un correo
                                                           #Al buzon de correo de la empresa Gibitnet

hora=$(date)
test=$(ipmitool sdr | grep T_AMB|awk '{print $3}')
echo ""
echo -e "\e[32m la temperatura es:\e[0m $test grados"
echo ""
echo "$date"
if  [ $test -ge 22 ]        #-ge es igual a >=
then
        echo "Enviando correo....."
        python sen_correo.py
        sleep 10
elif [ $test -ge 23 ]
then
		echo "Enviando correo de 30 grados......"
		python sen_correo_30_grados.py
		sleep
else
		echo ""
        echo "\e[33m La temperatura es correcta\e[0m"
fi
echo
