#!/bin/bash

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

LATEST_BACKUP=$(find "$PROJECT_DIR/backups" -mindepth 1 -maxdepth 1 -type d | sort | tail -n1)

if [ -z "$LATEST_BACKUP" ]; then
    echo "No se encontró ningún respaldo."
    exit 1
fi

echo "=========================================="
echo " Restaurando respaldo"
echo "=========================================="

echo
echo "Usando:"
echo "$LATEST_BACKUP"

cp -a "$LATEST_BACKUP/config/.config/." ~/.config/ 2>/dev/null || true
cp -a "$LATEST_BACKUP/config/.local/share/." ~/.local/share/ 2>/dev/null || true
cp -a "$LATEST_BACKUP/config/.themes/." ~/.themes/ 2>/dev/null || true
cp -a "$LATEST_BACKUP/config/.icons/." ~/.icons/ 2>/dev/null || true
cp -a "$LATEST_BACKUP/config/.fonts/." ~/.fonts/ 2>/dev/null || true

kbuildsycoca6 || true

echo
echo "=========================================="
echo " Restauración completada"
echo "=========================================="

echo
echo "Se recomienda cerrar sesión y volver a iniciarla."
