#!/bin/bash

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$PROJECT_DIR/backups/$(date +%Y-%m-%d_%H-%M-%S)"

echo "=========================================="
echo " Creando respaldo"
echo "=========================================="

mkdir -p "$BACKUP_DIR"

echo
echo "Respaldando configuración..."

mkdir -p "$BACKUP_DIR/config"

cp -a ~/.config "$BACKUP_DIR/config/"
cp -a ~/.local/share "$BACKUP_DIR/config/"
cp -a ~/.themes "$BACKUP_DIR/config/" 2>/dev/null || true
cp -a ~/.icons "$BACKUP_DIR/config/" 2>/dev/null || true
cp -a ~/.fonts "$BACKUP_DIR/config/" 2>/dev/null || true

echo
echo "Guardando lista de paquetes..."

rpm -qa | sort > "$BACKUP_DIR/packages-rpm.txt"

echo
echo "Guardando Flatpaks..."

flatpak list --app --columns=application > "$BACKUP_DIR/packages-flatpak.txt"

echo
echo "=========================================="
echo " Respaldo completado"
echo "=========================================="

echo
echo "Ubicación:"
echo "$BACKUP_DIR"
