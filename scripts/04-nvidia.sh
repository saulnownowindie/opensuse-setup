#!/usr/bin/env bash

set -Eeuo pipefail

echo "=========================================="
echo " Instalando drivers NVIDIA"
echo "=========================================="

if ! lspci | grep -qi "NVIDIA"; then
    echo "No se detectó una GPU NVIDIA. Omitiendo este paso."
    exit 0
fi

echo

if rpm -q nvidia-driver-G06-kmp-default >/dev/null 2>&1; then
    echo "Los drivers NVIDIA ya están instalados."

    if command -v nvidia-smi >/dev/null 2>&1; then
        echo
        nvidia-smi
    fi

    exit 0
fi

echo "Actualizando repositorios..."

sudo zypper refresh

echo

if ! zypper lr | grep -qi nvidia; then
    echo "No se encontró el repositorio oficial de NVIDIA."
    echo "Configúralo antes de ejecutar este módulo."
    exit 1
fi

echo
echo "Instalando drivers NVIDIA..."

sudo zypper install -y --auto-agree-with-licenses \
kernel-firmware-nvidia \
nvidia-driver-G06-kmp-default \
nvidia-video-G06 \
nvidia-gl-G06 \
nvidia-compute-G06 \
nvidia-compute-utils-G06 \
nvidia-settings

echo
echo "Reconstruyendo initramfs..."

sudo dracut --force

echo

if command -v nvidia-smi >/dev/null 2>&1; then
    echo "Verificando instalación..."
    nvidia-smi
else
    echo "⚠ nvidia-smi todavía no está disponible."
    echo "Reinicia el equipo y vuelve a ejecutar la verificación."
fi

echo
echo "✓ Drivers NVIDIA instalados correctamente."
