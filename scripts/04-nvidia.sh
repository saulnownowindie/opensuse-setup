#!/bin/bash

set -e

echo "=================================="
echo "Instalando drivers NVIDIA"
echo "=================================="

echo
echo "Actualizando repositorios..."
sudo zypper refresh

echo
echo "Instalando drivers NVIDIA..."

sudo zypper install -y \
nvidia-video-G06 \
nvidia-gl-G06 \
nvidia-compute-G06 \
nvidia-compute-utils-G06 \
nvidia-settings

echo
echo "Regenerando initramfs..."

sudo dracut --force

echo
echo "✓ Drivers NVIDIA instalados."
echo
echo "Se recomienda reiniciar el equipo."
