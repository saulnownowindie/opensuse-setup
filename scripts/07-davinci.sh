#!/bin/bash

set -e

echo "=========================================="
echo "      DaVinci Resolve Installer"
echo "=========================================="

INSTALLER_DIR="$HOME/Instaladores"

echo
echo "Buscando instalador..."

INSTALLER=$(find "$INSTALLER_DIR" -maxdepth 1 -type f -name "DaVinci_Resolve*_Linux.run" | head -n 1)

if [ -z "$INSTALLER" ]; then
    echo
    echo "❌ No se encontró el instalador."
    echo
    echo "Descarga DaVinci Resolve Studio para Linux"
    echo "y copia el archivo .run a:"
    echo
    echo "$INSTALLER_DIR"
    exit 1
fi

echo
echo "✓ Instalador encontrado:"
echo "$INSTALLER"

echo
echo "Actualizando repositorios..."
sudo zypper refresh

echo
echo "Instalando dependencias..."

sudo zypper install -y \
fuse \
libxcrypt-compat \
libapr1 \
libaprutil1 \
libglib-2_0-0 \
libxcb-cursor0 \
libcurl4 \
libICE6 \
libSM6 \
libXi6 \
libXtst6 \
libXcursor1 \
libxkbcommon-x11-0

echo
echo "Dando permisos al instalador..."

chmod +x "$INSTALLER"

echo
echo "Ejecutando instalador..."

SKIP_PACKAGE_CHECK=1 "$INSTALLER"

echo
echo "Comprobando instalación..."

if [ -d "/opt/resolve" ]; then
    echo "✓ DaVinci Resolve instalado correctamente."
else
    echo
    echo "❌ La instalación parece haber fallado."
    exit 1
fi

echo
echo "=========================================="
echo "      Instalación completada"
echo "=========================================="

echo
echo "Es recomendable reiniciar el equipo antes de abrir DaVinci."
