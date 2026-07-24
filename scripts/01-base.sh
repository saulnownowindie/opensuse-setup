#!/bin/bash

set -e

echo "=================================="
echo " OpenSUSE Workstation Setup"
echo " Instalación base"
echo "=================================="

echo
echo "[1/3] Actualizando repositorios..."
sudo zypper refresh

echo
echo "[2/3] Actualizando el sistema..."
sudo zypper update -y

echo
echo "[3/3] Instalando herramientas básicas..."

sudo zypper install -y \
git \
curl \
wget \
nano \
vim \
htop \
btop \
fastfetch \
tree \
zip \
unzip \
tar \
gcc \
gcc-c++ \
make \
cmake

echo
echo "✓ Instalación base finalizada."
