#!/bin/bash

set -euo pipefail

echo "=========================================="
echo " Instalando aplicaciones Flatpak"
echo "=========================================="

echo
echo "Instalando Flatpak..."

sudo zypper install -y flatpak

echo
echo "Agregando Flathub..."

sudo flatpak remote-add --if-not-exists flathub \
https://flathub.org/repo/flathub.flatpakrepo

echo
echo "Instalando aplicaciones..."

flatpak install -y flathub \
com.spotify.Client \
com.discordapp.Discord \
com.heroicgameslauncher.hgl \
com.usebottles.bottles \
com.stremio.Stremio
com.valvesoftware.Steam

echo
echo "=========================================="
echo "Aplicaciones Flatpak instaladas."
echo "=========================================="
