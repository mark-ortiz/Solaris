#!/bin/bash
### Script para tener alias utiles en el .profile y en el .bashrc
cp .profile .profile.inicial
echo '### Alias utiles ###' >> .profile
echo 'alias c=clear' >> .profile
echo 'alias ll="ls -lh"' >> .profile
echo 'alias la="ls -lah"' >> .profile
echo 'alias lr="ls -lrth"' >> .profile
echo 'alias zpl="zpool list"' >> .profile
echo 'alias zfl="zfs list"' >> .profile
echo 'alias dh="df -h"' >> .profile
echo 'alias zl="zoneadm list -cv"' >> .profile
echo 'alias lds="ldm ls"' >> .profile
echo 'alias llb="ldm list-bindings"' >> .profile
echo 'alias lls="ldm list-services"' >> .profile
echo 'alias ldb="ldm ls-bindings"' >> .profile
### Cambio al .bashrc
cp .bashrc .bashrc.inicial
echo '### Alias utiles ###' >> .bashrc
echo 'alias c=clear' >> .bashrc
echo 'alias ll="ls -lh"' >> .bashrc
echo 'alias la="ls -lah"' >> .bashrc
echo 'alias lr="ls -lrth"' >> .bashrc
echo 'alias zpl="zpool list"' >> .bashrc
echo 'alias zfl="zfs list"' >> .bashrc
echo 'alias dh="df -h"' >> .bashrc
echo 'alias zl="zoneadm list -cv"' >> .bashrc
echo 'alias lds="ldm ls"' >> .bashrc
echo 'alias llb="ldm list-bindings"' >> .bashrc
echo 'alias lls="ldm list-services"' >> .bashrc
echo 'alias ldb="ldm ls-bindings"' >> .bashrc
