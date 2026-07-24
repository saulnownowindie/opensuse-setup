#!/usr/bin/env bash

set -Eeuo pipefail

echo "=========================================="
echo " Configuración de repositorios"
echo "=========================================="

echo
echo "Verificando repositorios..."

if ! zypper lr >/dev/null; then
    echo "No fue posible obtener la lista de repositorios."
    exit 1
fi

echo
echo "Actualizando metadatos..."

sudo zypper --gpg-auto-import-keys refresh

echo
echo "Repositorios habilitados:"
zypper lr -d

echo
echo "Comprobando paquetes bloqueados..."

zypper locks || true

echo
echo "Repositorios verificados correctamente."
