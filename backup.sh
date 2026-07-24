#!/bin/bash

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=========================================="
echo " Respaldando configuración"
echo "=========================================="

mkdir -p "$PROJECT_DIR/config/.config"
mkdir -p "$PROJECT_DIR/config/.local/share"

echo
echo "Respaldando configuración de KDE..."

FILES=(
kdeglobals
kwinrc
plasmarc
plasmashellrc
konsolerc
dolphinrc
spectaclerc
kcminputrc
kglobalshortcutsrc
kscreenlockerrc
powermanagementprofilesrc
gtkrc
gtkrc-2.0
)

for file in "${FILES[@]}"; do
    if [ -f "$HOME/.config/$file" ]; then
        cp "$HOME/.config/$file" "$PROJECT_DIR/config/.config/"
        echo "✓ $file"
    fi
done

echo
echo "Respaldando temas..."

cp -a ~/.local/share/color-schemes "$PROJECT_DIR/config/.local/share/" 2>/dev/null || true
cp -a ~/.local/share/icons "$PROJECT_DIR/config/.local/share/" 2>/dev/null || true
cp -a ~/.local/share/plasma "$PROJECT_DIR/config/.local/share/" 2>/dev/null || true

echo
echo "Respaldando temas personales..."

cp -a ~/.themes "$PROJECT_DIR/config/" 2>/dev/null || true
cp -a ~/.icons "$PROJECT_DIR/config/" 2>/dev/null || true
cp -a ~/.fonts "$PROJECT_DIR/config/" 2>/dev/null || true

echo
echo "Respaldando DaVinci Resolve..."

if [ -d "$HOME/.local/share/DaVinciResolve" ]; then
    mkdir -p "$PROJECT_DIR/config/.local/share"

    cp -a "$HOME/.local/share/DaVinciResolve" \
          "$PROJECT_DIR/config/.local/share/"

    rm -rf "$PROJECT_DIR/config/.local/share/DaVinciResolve/logs"
    rm -rf "$PROJECT_DIR/config/.local/share/DaVinciResolve/Fusion/DiskCache"
    rm -f "$PROJECT_DIR/config/.local/share/DaVinciResolve/configs/OFXPluginCacheV2.xml"

    echo "✓ DaVinci Resolve"
fi

echo
echo "Respaldando AutoSubs..."

if [ -d "$HOME/.local/share/com.autosubs" ]; then
    cp -a "$HOME/.local/share/com.autosubs" \
          "$PROJECT_DIR/config/.local/share/"
    echo "✓ AutoSubs"
fi

echo
echo "=========================================="
echo " Respaldo finalizado"
echo "=========================================="
