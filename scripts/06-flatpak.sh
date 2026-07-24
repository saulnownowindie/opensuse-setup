#!/usr/bin/env bash

set -Eeuo pipefail

echo "=========================================="
echo " Configurando Flatpak"
echo "=========================================="

echo
echo "Instalando Flatpak..."

sudo zypper install -y flatpak

if ! command -v flatpak >/dev/null 2>&1; then
    echo "No fue posible instalar Flatpak."
    exit 1
fi

echo
echo "Agregando Flathub..."

sudo flatpak remote-add --if-not-exists flathub \
 https://flathub.org/repo/flathub.flatpakrepo

echo
echo "Instalando aplicaciones Flatpak..."

sudo flatpak install -y flathub \
com.spotify.Client \
com.discordapp.Discord \
com.heroicgameslauncher.hgl \
com.usebottles.bottles \
com.stremio.Stremio \
com.valvesoftware.Steam

echo
echo "Actualizando aplicaciones Flatpak..."

sudo flatpak update -y --noninteractive

echo
echo "✓ Flatpak configurado correctamente."
