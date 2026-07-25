#!/usr/bin/env bash

set -Eeuo pipefail

########################################
# Directorios
########################################

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_DIR="$PROJECT_DIR/scripts"
CONFIG_DIR="$PROJECT_DIR/config"
LOG_DIR="$PROJECT_DIR/logs"
BACKUP_DIR="$PROJECT_DIR/backups"

mkdir -p \
    "$CONFIG_DIR" \
    "$LOG_DIR" \
    "$BACKUP_DIR" \
    "$PROJECT_DIR/installers"

LOG_FILE="$LOG_DIR/install-$(date +%F-%H%M%S).log"

########################################
# Configuración
########################################

SETTINGS="$CONFIG_DIR/settings.conf"

if [[ ! -f "$SETTINGS" ]]; then
    echo "No se encontró: $SETTINGS"
    exit 1
fi

source "$SETTINGS"

########################################
# Logs
########################################

exec > >(tee -a "$LOG_FILE")
exec 2>&1

########################################
# Colores
########################################

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m'

########################################
# Variables
########################################

START_TIME=$(date +%s)
CURRENT_SCRIPT=""

########################################
# Mantener sudo activo
########################################

echo "Verificando permisos..."

sudo -v

while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

SUDO_KEEPALIVE=$!

cleanup() {
    kill "$SUDO_KEEPALIVE" 2>/dev/null || true
}

trap cleanup EXIT

########################################
# Error Handler
########################################

trap '
echo
echo -e "${RED}✗ Error ejecutando:${NC} ${CURRENT_SCRIPT:-desconocido}"
exit 1
' ERR

########################################
# Encabezado
########################################

echo
echo "=============================================="
echo "     OpenSUSE Workstation Installer"
echo "=============================================="
echo

echo "Proyecto : $PROJECT_DIR"
echo "Log       : $LOG_FILE"

echo

########################################
# Verificar sistema
########################################

if ! grep -qi opensuse /etc/os-release; then
    echo -e "${RED}Este instalador solamente funciona en openSUSE${NC}"
    exit 1
fi

########################################
# Verificar conexión
########################################

echo "Comprobando conexión a Internet..."

if ! curl -fsSL https://www.opensuse.org >/dev/null; then
    echo -e "${RED}No hay conexión a Internet.${NC}"
    exit 1
fi

########################################
# Módulos
########################################

declare -A MODULES=(
    ["01-system.sh"]="INSTALL_SYSTEM"
    ["02-repositories.sh"]="INSTALL_REPOSITORIES"
    ["03-multimedia.sh"]="INSTALL_MULTIMEDIA"
    ["04-nvidia.sh"]="INSTALL_NVIDIA"
    ["05-packages.sh"]="INSTALL_PACKAGES"
    ["06-flatpak.sh"]="INSTALL_FLATPAK"
    ["07-davinci.sh"]="INSTALL_DAVINCI"
    ["08-autosubs.sh"]="INSTALL_AUTOSUBS"
    ["09-kde.sh"]="INSTALL_KDE"
    ["10-darkly.sh"]="INSTALL_DARKLY"
    ["11-cleanup.sh"]="RUN_CLEANUP"
    ["12-verify.sh"]="RUN_VERIFY"
    ["13-tools.sh"]="INSTALL_TOOLS"
)
########################################
# Buscar scripts
########################################

mapfile -t SCRIPTS < <(
    find "$SCRIPT_DIR" \
        -maxdepth 1 \
        -type f \
        -name "*.sh" \
        ! -name "*.bak" \
        ! -name "*.old" \
        ! -name "*.disabled" \
    | sort
)

TOTAL=${#SCRIPTS[@]}
COUNT=0
SUCCESS=()
SKIPPED=()

########################################
# Ejecutar módulos
########################################

for script in "${SCRIPTS[@]}"; do

    COUNT=$((COUNT + 1))

    CURRENT_SCRIPT=$(basename "$script")

    SETTING="${MODULES[$CURRENT_SCRIPT]:-}"

    if [[ -n "$SETTING" ]]; then
        if [[ "${!SETTING}" != "true" ]]; then
            echo
            echo -e "${YELLOW}⏭ Omitiendo $CURRENT_SCRIPT ($SETTING=false)${NC}"

            SKIPPED+=("$CURRENT_SCRIPT")

            continue
        fi
    fi

    echo
    echo "=============================================="
    echo -e "${BLUE}[$COUNT/$TOTAL]${NC} $CURRENT_SCRIPT"
    echo "=============================================="

    bash "$script"

    SUCCESS+=("$CURRENT_SCRIPT")

    echo
    echo -e "${GREEN}✓ Finalizado${NC}"

done

########################################
# Tiempo
########################################

END_TIME=$(date +%s)
TOTAL_TIME=$((END_TIME - START_TIME))

########################################
# Resumen
########################################

echo
echo "=============================================="
echo "Resumen"
echo "=============================================="
echo
echo "Módulos ejecutados:"

for item in "${SUCCESS[@]}"; do
    echo "  ✓ $item"
done

echo

if (( ${#SKIPPED[@]} > 0 )); then
    echo "Módulos omitidos:"

    for item in "${SKIPPED[@]}"; do
        echo "  - $item"
    done

    echo
fi

echo "Tiempo : ${TOTAL_TIME}s"
echo "Log    : $LOG_FILE"

echo
echo -e "${GREEN}Instalación finalizada correctamente.${NC}"
