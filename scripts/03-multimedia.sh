#!/usr/bin/env bash

set -Eeuo pipefail

echo "=========================================="
echo " Herramientas multimedia"
echo "=========================================="

echo
echo "Actualizando metadatos..."

sudo zypper refresh

echo
echo "Instalando herramientas multimedia..."

sudo zypper install -y \
ffmpeg \
ffmpegthumbnailer \
vlc \
mediainfo \
yt-dlp

echo
echo "Herramientas multimedia instaladas correctamente."
