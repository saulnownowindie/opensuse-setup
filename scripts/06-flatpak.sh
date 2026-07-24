#!/bin/bash

set -e

echo "=================================="
echo "Configurando Flatpak"
echo "=================================="

sudo zypper install -y flatpak

flatpak remote-add --if-not-exists flathub \
https://flathub.org/repo/flathub.flatpakrepo

echo
echo "✓ Flatpak configurado."
