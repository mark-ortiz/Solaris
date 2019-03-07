#!/bin/bash
### Script para montar en /mnt el software del servidor 198
# Instalar paquetes - por si se trata de una zona
pkg install pkg://solaris/system/file-system/smb
pkg install pkg://solaris/service/file-system/smb
pkg install samba
svcadm enable idmap
svcadm enable smb/client
mount -F smbfs -o ro,user=ftpuser //192.168.15.198/software /mnt
