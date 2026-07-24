#!/bin/bash

set -euo pipefail

echo "=========================================="
echo " Restaurando configuración de KDE"
echo "=========================================="

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

CONFIG_DIR="$PROJECT_DIR/config"

if [ ! -d "$CONFIG_DIR" ]; then
    echo
    echo "❌ No existe la carpeta config."
    exit 1
fi

echo
echo "Creando directorios..."

mkdir -p ~/.config
mkdir -p ~/.local/share

echo
echo "Restaurando .config..."

if [ -d "$CONFIG_DIR/.config" ]; then
    cp -a "$CONFIG_DIR/.config/." ~/.config/
fi

echo
echo "Restaurando .local/share..."

if [ -d "$CONFIG_DIR/.local/share" ]; then
    cp -a "$CONFIG_DIR/.local/share/." ~/.local/share/
fi

echo
echo "Actualizando caché de KDE..."

kbuildsycoca6 || true

echo
echo "=========================================="
echo " Configuración restaurada"
echo "=========================================="

echo
echo "Se recomienda cerrar sesión y volver a iniciarla."
