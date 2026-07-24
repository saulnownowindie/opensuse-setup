#!/bin/bash

set -euo pipefail

echo "=========================================="
echo " Instalando drivers NVIDIA"
echo "=========================================="

if ! lspci | grep -qi "NVIDIA"; then
    echo "No se detectó una GPU NVIDIA. Omitiendo este paso."
    exit 0
fi

echo
echo "Actualizando repositorios..."
sudo zypper refresh

echo
echo "Instalando drivers NVIDIA..."

sudo zypper install -y \
kernel-firmware-nvidia \
nvidia-video-G06 \
nvidia-gl-G06 \
nvidia-compute-G06 \
nvidia-compute-utils-G06 \
nvidia-settings

echo
echo "Regenerando initramfs..."

sudo dracut --force

echo
echo "Verificando instalación..."

if command -v nvidia-smi >/dev/null 2>&1; then
    nvidia-smi
    echo
    echo "✓ Drivers NVIDIA instalados correctamente."
else
    echo
    echo "⚠ NVIDIA instalada, pero nvidia-smi aún no está disponible."
    echo "Reinicia el equipo y vuelve a ejecutar la verificación."
fi
