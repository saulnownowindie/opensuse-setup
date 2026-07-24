#!/bin/bash

set -euo pipefail

echo "=========================================="
echo " Limpiando el sistema"
echo "=========================================="

echo
echo "Eliminando paquetes innecesarios..."

sudo zypper packages --unneeded

echo
echo "Limpiando caché..."

sudo zypper clean --all

echo
echo "Eliminando caché de Flatpak..."

flatpak uninstall --unused -y || true

echo
echo "=========================================="
echo " Limpieza completada"
echo "=========================================="
