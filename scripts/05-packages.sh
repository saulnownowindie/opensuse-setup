#!/usr/bin/env bash

set -Eeuo pipefail

echo "=========================================="
echo " Instalando aplicaciones"
echo "=========================================="

echo
echo "Actualizando metadatos..."

sudo zypper refresh

echo
echo "Instalando aplicaciones..."

sudo zypper install -y \
audacity \
dolphin \
filelight \
firefox \
gwenview \
kate \
kcalc \
kcharselect \
kcolorchooser \
kdeconnect-kde \
kdialog \
kfind \
kgpg \
kio-admin \
konsole \
krita \
libavcodec-full \
obs-studio \
okular \
p7zip \
partitionmanager \
python3 \
python3-pip \
spectacle

echo
echo "Aplicaciones instaladas correctamente."
