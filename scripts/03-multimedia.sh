#!/bin/bash

set -e

echo "=================================="
echo "Instalando herramientas multimedia"
echo "=================================="

sudo zypper install -y \
ffmpeg \
ffmpegthumbnailer \
vlc \
mediainfo \
yt-dlp

echo
echo "✓ Multimedia instalada."
