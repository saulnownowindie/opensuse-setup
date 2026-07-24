#!/bin/bash

set -euo pipefail

echo "=========================================="
echo " Sistema base"
echo "=========================================="

echo
echo "Actualizando repositorios..."
sudo zypper refresh

echo
echo "Actualizando el sistema..."
sudo zypper dup -y

echo
echo "Instalando herramientas base..."

sudo zypper install -y \
bash-completion \
btop \
cmake \
curl \
fastfetch \
ffmpeg \
ffmpegthumbnailer \
gcc \
gcc-c++ \
git \
gzip \
htop \
make \
nano \
neovim \
tar \
tree \
unrar \
unzip \
vim \
wget \
xz \
yt-dlp \
zip

echo
echo "Instalando utilidades..."

sudo zypper install -y \
file \
which \
rsync \
openssh \
ca-certificates \
openssl \
pciutils \
usbutils \
lshw \
smartmontools

echo
echo "Sistema base instalado correctamente."
