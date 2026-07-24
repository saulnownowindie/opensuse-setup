#!/usr/bin/env bash

set -Eeuo pipefail

echo "=========================================="
echo "      DaVinci Resolve Installer"
echo "=========================================="

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INSTALLER_DIR="$PROJECT_DIR/installers"

echo
echo "Buscando instalador..."

if [[ ! -d "$INSTALLER_DIR" ]]; then
    echo "No existe la carpeta:"
    echo "$INSTALLER_DIR"
    exit 1
fi

INSTALLER=$(find "$INSTALLER_DIR" \
    -maxdepth 1 \
    -type f \
    -name "DaVinci_Resolve*_Linux.run" \
    | head -n1)

if [[ -z "$INSTALLER" ]]; then
    echo
    echo "No se encontró ningún instalador de DaVinci Resolve."
    echo
    echo "Copia el archivo .run dentro de:"
    echo "$INSTALLER_DIR"
    exit 1
fi

if [[ -d /opt/resolve ]]; then
    echo
    echo "DaVinci Resolve ya está instalado."
    exit 0
fi

echo
echo "Instalador encontrado:"
echo "$INSTALLER"

echo
echo "Actualizando metadatos..."

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
echo "Verificando instalación..."

if [[ -d /opt/resolve ]]; then
    echo "DaVinci Resolve instalado correctamente."
else
    echo
    echo "La instalación parece haber fallado."
    exit 1
fi

echo
echo "=========================================="
echo "      Instalación completada"
echo "=========================================="

echo
echo "Se recomienda reiniciar el equipo antes de abrir DaVinci Resolve."
