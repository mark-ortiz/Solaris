#!/bin/bash
### Script para tener alias utiles en el .profile y en el .bashrc
cp /root/.profile /root/.profile.anterior
echo '### Alias utiles ###' >> /root/.profile
echo 'alias c=clear' >> /root/.profile
echo 'alias ll="ls -lh"' >> /root/.profile
echo 'alias la="ls -lah"' >> /root/.profile
echo 'alias lr="ls -lrth"' >> /root/.profile
echo 'alias zpl="zpool list"' >> /root/.profile
echo 'alias zfl="zfs list"' >> /root/.profile
echo 'alias dh="df -h"' >> /root/.profile
echo 'alias zl="zoneadm list -cv"' >> /root/.profile
echo 'alias lds="ldm ls"' >> /root/.profile
echo 'alias llb="ldm list-bindings"' >> /root/.profile
echo 'alias lls="ldm list-services"' >> /root/.profile
echo 'alias ldb="ldm ls-bindings"' >> /root/.profile
