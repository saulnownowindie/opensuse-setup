#!/bin/bash

set -euo pipefail

echo "=========================================="
echo " Configurando repositorios"
echo "=========================================="

echo
echo "Actualizando información..."

sudo zypper refresh

echo
echo "Repositorios actuales:"
zypper repos

echo
echo "Actualizando prioridades..."

sudo zypper refresh

echo
echo "Repositorios configurados correctamente."
