#!/bin/bash

set -e

echo "=================================="
echo "Instalando aplicaciones"
echo "=================================="

sudo zypper install -y \
git \
curl \
wget \
fastfetch \
htop \
btop \
tree \
vlc \
ffmpeg \
yt-dlp \
obs-studio

echo
echo "✓ Aplicaciones instaladas."
