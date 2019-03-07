#!/bin/bash
cd /proc
for i in *; do
    SWAP=`pmap -S $i |grep ^total | awk '{print $4; }'`
    [ "xx$SWAP" != "xx" ] && echo "$SWAP bytes $i"
done |sort -n
#### El script original estaba mal - una tarugada pero estaba mal y daba la info mal
#### Corregido por Ing. Marco Ortiz
#### Idea original tomada de https://serverfault.com/questions/664647/solaris-how-to-list-swap-space-per-process
