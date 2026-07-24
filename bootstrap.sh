#!/bin/bash

set -euo pipefail

echo "=========================================="
echo " OpenSUSE Setup Bootstrap"
echo "=========================================="

if ! grep -qi "opensuse" /etc/os-release; then
    echo "Este script solo funciona en openSUSE."
    exit 1
fi

echo
echo "Instalando dependencias..."

sudo zypper refresh
sudo zypper install -y git curl

INSTALL_DIR="$HOME/opensuse-setup"

if [ -d "$INSTALL_DIR/.git" ]; then
    echo
    echo "Actualizando repositorio..."
    git -C "$INSTALL_DIR" pull
else
    echo
    echo "Clonando repositorio..."
    git clone https://github.com/saulnownowindie/opensuse-setup.git "$INSTALL_DIR"
fi

cd "$INSTALL_DIR"

chmod +x *.sh
chmod +x scripts/*.sh

echo
echo "Iniciando instalación..."

./install.sh
