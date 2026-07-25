#!/usr/bin/env bash

set -Eeuo pipefail

echo "=========================================="
echo " Instalando entorno gaming"
echo "=========================================="

echo
echo "Actualizando repositorios..."

sudo zypper refresh


echo
echo "Instalando Steam nativo..."
sudo zypper install -y --auto-agree-with-licenses \
steam \
gamemode \
mangohud \
vulkan-tools


echo
echo "Instalando herramientas Vulkan NVIDIA..."

sudo zypper install -y --auto-agree-with-licenses \
libvulkan1 \
vulkan-tools


echo
echo "Configurando GameMode..."

systemctl --user enable --now gamemoded.service 2>/dev/null || true


echo
echo "Verificando Steam..."

if command -v steam >/dev/null 2>&1; then
    echo "Steam instalado correctamente."
else
    echo "Steam no pudo ser verificado."
fi


echo
echo "Verificando Vulkan..."

vulkaninfo --summary 2>/dev/null || true


echo
echo "=========================================="
echo " Gaming instalado"
echo "=========================================="

echo
echo "Incluye:"
echo "- Steam nativo RPM"
echo "- Vulkan"
echo "- GameMode"
echo "- MangoHUD"
