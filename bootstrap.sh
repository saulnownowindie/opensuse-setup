#!/usr/bin/env bash

set -Eeuo pipefail

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

if [[ -d "$INSTALL_DIR/.git" ]]; then
    echo
    echo "Actualizando repositorio..."

    git -C "$INSTALL_DIR" pull --ff-only
else
    echo
    echo "Clonando repositorio..."

    git clone \
    https://github.com/saulnownowindie/opensuse-setup.git \
    "$INSTALL_DIR"
fi

cd "$INSTALL_DIR"

echo
echo "Asignando permisos..."

find . -name "*.sh" -exec chmod +x {} \;

echo
echo "Iniciando instalación..."

./install.sh
