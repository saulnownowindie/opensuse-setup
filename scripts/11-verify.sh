#!/bin/bash

set -euo pipefail

echo "=========================================="
echo " Verificando instalación"
echo "=========================================="

check() {
    if command -v "$1" >/dev/null 2>&1; then
        printf "✓ %-20s OK\n" "$1"
    else
        printf "✗ %-20s NO INSTALADO\n" "$1"
    fi
}

echo
echo "Programas"

check git
check ffmpeg
check yt-dlp
check flatpak
check vlc
check obs
check audacity
check fastfetch

echo
echo "Flatpak"

flatpak list | grep -qi spotify && echo "✓ Spotify" || echo "✗ Spotify"
flatpak list | grep -qi discord && echo "✓ Discord" || echo "✗ Discord"
flatpak list | grep -qi heroic && echo "✓ Heroic" || echo "✗ Heroic"
flatpak list | grep -qi bottles && echo "✓ Bottles" || echo "✗ Bottles"
flatpak list | grep -qi stremio && echo "✓ Stremio" || echo "✗ Stremio"
flatpak list | grep -qi steam && echo "✓ Steam" || echo "✗ Steam"

echo
echo "NVIDIA"

if lsmod | grep -q nvidia; then
    echo "✓ Driver NVIDIA cargado"
else
    echo "✗ Driver NVIDIA no cargado"
fi

echo
echo "DaVinci Resolve"

if [ -d /opt/resolve ]; then
    echo "✓ DaVinci Resolve"
else
    echo "✗ DaVinci Resolve"
fi

echo
echo "AutoSubs"

if rpm -q auto-subs >/dev/null 2>&1; then
    echo "✓ AutoSubs"
else
    echo "✗ AutoSubs"
fi

echo
echo "Darkly"

if [ -f /usr/lib64/qt6/plugins/org.kde.kdecoration2/org.kde.darkly.so ]; then
    echo "✓ Darkly"
else
    echo "✗ Darkly"
fi

echo
echo "Sistema"

echo "Kernel : $(uname -r)"
echo "Sesión : ${XDG_SESSION_TYPE:-desconocida}"
echo "GPU    : $(lspci | grep -i 'vga\|3d' | head -n1)"

echo
echo "=========================================="
echo " Verificación finalizada"
echo "=========================================="
