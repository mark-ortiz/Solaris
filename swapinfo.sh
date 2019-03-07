#!/bin/bash
./verswap.sh > proc_analisis_swap.txt
clear
echo -e "\e[4;93mAnalisis del swap\e[0m"
echo -e "\e[1mTamaño de página y muestra de swap asignado y reservado\e[0m"
pagesize -a;swap -sh
echo
echo -e "\e[1mVerificación de si realmente se estan usando páginas del dispositivo swap\e[0m"
echo ::swapinfo | mdb -k
echo -e "\e[1mVerificación si hay páginas de KERNEL en el swap\e[0m"
echo "hardswap/D" | mdb -k
echo -e "\e[1mVerificación si hay páginas de otros procesos que no sean KERNEL en el swap\e[0m"
echo "softswap/D" | mdb -k
echo -e "\e[1mVerificación a detalle de si algo realmente esta swapeando pi y po\e[0m"
vmstat -p 1 3
echo -e "\e[4;93mLos 5 procesos que mas páginas de memoria (no necesariamente swap) estan usando son:\e[0m"
echo TAMAÑO      PROCESO
tail -5 proc_analisis_swap.txt
echo -e "\e[1mPor último, Analizando si el sistema realmente esta swapeando\e[0m"
echo nscan/E | mdb -k
###### NOTAS #####
#### Idea original tomada de: https://www.oracle.com/technetwork/articles/servers-storage-admin/monitor-swap-solaris-zfs-2216650.html
#### La idea general es determinar que procesos pudieran estar usando swap y cuanto
#### No es simple esta tarea pero este script lo facilita
#### Lo mas importante es verificar si se estan usando páginas del dispositivo de swap o no
#### Es facil confundir las páginas de memoria RAM física con páginas de memoria SWAP, ya que los procesos los usan indistintamente
#### y empiezan a usar el espacio del "swap" una vez que ha alcanzado cierto umbral, alrededor del 5% de la memoria libre (no es exacto)
#### Para mayor detalle consultar el url mencionado arriba en la Idea Original
#### Si quieres encontrar el proceso que esta usando el swap tambien puede ayudar el comando de la siguiente linea pero es DTRACE
#### dtrace -n 'vminfo:::anonpgin { @[pid, execname] = count(); }'
