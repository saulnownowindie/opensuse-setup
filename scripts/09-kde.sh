#!/usr/bin/env bash

set -Eeuo pipefail

echo "=========================================="
echo " Restaurando configuración de KDE"
echo "=========================================="

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

CONFIG_DIR="$PROJECT_DIR/config"

BACKUP_DIR="$HOME/.config-backup-$(date +%F-%H%M%S)"

echo
echo "Verificando dependencias..."

if ! command -v rsync >/dev/null 2>&1; then
    echo "Instalando rsync..."
    sudo zypper install -y rsync
fi


echo
echo "Creando backup..."

mkdir -p "$BACKUP_DIR"

rsync -a "$HOME/.config/" "$BACKUP_DIR/" 2>/dev/null || true
rsync -a "$HOME/.local/share/" "$BACKUP_DIR/local-share/" 2>/dev/null || true


echo
echo "Restaurando configuración KDE..."

if [[ -d "$CONFIG_DIR/.config" ]]; then
    rsync -a "$CONFIG_DIR/.config/" "$HOME/.config/"
else
    echo "No existe config/.config"
fi


echo
echo "Restaurando datos locales..."

if [[ -d "$CONFIG_DIR/.local/share" ]]; then
    rsync -a "$CONFIG_DIR/.local/share/" "$HOME/.local/share/"
fi


echo
echo "Actualizando caché KDE..."

command -v kbuildsycoca6 >/dev/null && kbuildsycoca6 || true


echo
echo "Reiniciando configuración KWin..."

if command -v kwriteconfig6 >/dev/null; then
    echo "Configuración KWin aplicada."
fi


echo
echo "=========================================="
echo " Configuración KDE restaurada"
echo "=========================================="

echo
echo "Backup creado en:"
echo "$BACKUP_DIR"

echo
echo "Se recomienda cerrar sesión y volver a iniciar."
