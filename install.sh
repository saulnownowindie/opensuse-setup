#!/bin/bash

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_DIR="$PROJECT_DIR/scripts"
LOG_DIR="$PROJECT_DIR/logs"

mkdir -p "$LOG_DIR"

LOG_FILE="$LOG_DIR/install-$(date +%Y%m%d-%H%M%S).log"

exec > >(tee -a "$LOG_FILE")
exec 2>&1

START_TIME=$(date +%s)

echo "=================================================="
echo "      OpenSUSE Workstation Installer"
echo "=================================================="
echo
echo "Proyecto : $PROJECT_DIR"
echo "Log       : $LOG_FILE"
echo

#############################################
# Verificar sistema operativo
#############################################

if ! grep -qi "opensuse" /etc/os-release; then
    echo "❌ Este instalador solo funciona en openSUSE."
    exit 1
fi

#############################################
# Crear carpetas necesarias
#############################################

mkdir -p "$PROJECT_DIR"/{installers,config,logs,backups}

#############################################
# Ejecutar scripts
#############################################

for script in "$SCRIPT_DIR"/*.sh; do

    echo
    echo "--------------------------------------------------"
    echo "Ejecutando $(basename "$script")"
    echo "--------------------------------------------------"

    bash "$script"

    echo
    echo "✓ Finalizado $(basename "$script")"

done

#############################################
# Tiempo total
#############################################

END_TIME=$(date +%s)
SECONDS_TOTAL=$((END_TIME-START_TIME))

echo
echo "=================================================="
echo "Instalación completada correctamente."
echo "Tiempo total: ${SECONDS_TOTAL} segundos."
echo "=================================================="
