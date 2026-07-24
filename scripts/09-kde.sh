#!/usr/bin/env bash

set -Eeuo pipefail

echo "=========================================="
echo " Restaurando configuración de KDE"
echo "=========================================="

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

CONFIG_DIR="$PROJECT_DIR/config"

BACKUP_DIR="$HOME/.config-backup-$(date +%F-%H%M%S)"

if [[ ! -d "$CONFIG_DIR" ]]; then
    echo
    echo "No existe la carpeta config."
    exit 1
fi

echo
echo "Verificando dependencias..."

if ! command -v rsync >/dev/null 2>&1; then
    echo "Instalando rsync..."
    sudo zypper install -y rsync
fi

echo
echo "Creando backup de configuración actual..."

mkdir -p "$BACKUP_DIR"

if [[ -d "$HOME/.config" ]]; then
    rsync -a "$HOME/.config/" "$BACKUP_DIR/.config/"
fi

if [[ -d "$HOME/.local/share" ]]; then
    rsync -a "$HOME/.local/share/" "$BACKUP_DIR/.local-share/"
fi

echo
echo "Creando directorios..."

mkdir -p \
"$HOME/.config" \
"$HOME/.local/share"

echo
echo "Restaurando configuración KDE..."

if [[ -d "$CONFIG_DIR/.config" ]]; then
    rsync -a "$CONFIG_DIR/.config/" "$HOME/.config/"
fi

echo
echo "Restaurando datos locales..."

if [[ -d "$CONFIG_DIR/.local/share" ]]; then
    rsync -a "$CONFIG_DIR/.local/share/" "$HOME/.local/share/"
fi

echo
echo "Actualizando caché de KDE..."

if command -v kbuildsycoca6 >/dev/null 2>&1; then
    kbuildsycoca6 || true
fi

echo
echo "=========================================="
echo " Configuración KDE restaurada"
echo "=========================================="

echo
echo "Backup creado en:"
echo "$BACKUP_DIR"

echo
echo "Se recomienda cerrar sesión y volver a iniciarla."
