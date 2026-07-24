#!/usr/bin/env bash

set -Eeuo pipefail

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
bash \
bash-completion \
gzip \
tar \
xz \
zip \
unzip \
unrar \
wget \
curl \
ca-certificates \
openssl \
openssh \
file \
which \
rsync

echo
echo "Instalando herramientas de desarrollo..."

sudo zypper install -y \
gcc \
gcc-c++ \
make \
cmake \
git

echo
echo "Instalando utilidades del sistema..."

sudo zypper install -y \
nano \
vim \
neovim \
tree \
btop \
htop \
fastfetch \
pciutils \
usbutils \
lshw \
smartmontools

echo
echo "Sistema base instalado correctamente."
