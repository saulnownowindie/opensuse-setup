#!/usr/bin/env bash

set -Eeuo pipefail

echo "=========================================="
echo " Limpieza del sistema"
echo "=========================================="

echo
echo "Buscando paquetes innecesarios..."

UNNEEDED=$(zypper --non-interactive packages --unneeded 2>/dev/null | grep "^i " || true)

if [[ -n "$UNNEEDED" ]]; then
    echo
    echo "Paquetes que podrían eliminarse:"
    echo "$UNNEEDED"
    echo
    echo "No se eliminarán automáticamente."
    echo "Revísalos manualmente si deseas liberar espacio."
else
    echo "No se encontraron paquetes innecesarios."
fi

echo
echo "Limpiando caché de zypper..."

sudo zypper clean --all

echo
echo "Eliminando caché de Flatpak..."

if command -v flatpak >/dev/null 2>&1; then
    flatpak uninstall --unused -y || true
fi

echo
echo "=========================================="
echo " Limpieza completada"
echo "=========================================="
