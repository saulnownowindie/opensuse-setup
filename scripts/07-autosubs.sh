#!/bin/bash

set -euo pipefail

echo "=========================================="
echo " Instalando AutoSubs"
echo "=========================================="

INSTALLER_DIR="$(dirname "$0")/../installers"

INSTALLER=$(find "$INSTALLER_DIR" -maxdepth 1 -type f -name "AutoSubs*.deb" | head -n1)

if [ -z "$INSTALLER" ]; then
    echo
    echo "❌ No se encontró AutoSubs."
    echo
    echo "Coloca el .deb dentro de:"
    echo "$INSTALLER_DIR"
    exit 1
fi

echo
echo "Verificando DaVinci Resolve..."

if [ ! -d "/opt/resolve" ]; then
    echo "❌ DaVinci Resolve no está instalado."
    exit 1
fi

echo
echo "Instalando AutoSubs..."

sudo zypper install -y "$INSTALLER"

echo
echo "Verificando instalación..."

if rpm -q auto-subs >/dev/null 2>&1; then
    echo "✓ AutoSubs instalado correctamente."
else
    echo "⚠ No fue posible verificar la instalación."
fi

echo
echo "=========================================="
echo " AutoSubs listo"
echo "=========================================="
