#!/bin/bash

set -euo pipefail

echo "=========================================="
echo " Instalando paquetes"
echo "=========================================="

echo
echo "Actualizando repositorios..."

sudo zypper refresh

echo
echo "Instalando aplicaciones..."

sudo zypper install -y \
audacity \
btop \
curl \
dolphin \
fastfetch \
ffmpeg \
ffmpegthumbnailer \
filelight \
firefox \
flatpak \
git \
gwenview \
htop \
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
mediainfo \
nano \
neofetch \
obs-studio \
okular \
p7zip \
partitionmanager \
python3 \
python3-pip \
rsync \
spectacle \
tree \
unrar \
unzip \
vlc \
wget \
yt-dlp \
zip

echo
echo "Aplicaciones instaladas correctamente."
