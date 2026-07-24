#!/usr/bin/env bash

set -Eeuo pipefail

echo "=========================================="
echo " Verificación de instalación"
echo "=========================================="

check_command() {

    if command -v "$1" >/dev/null 2>&1; then
        printf "✓ %-20s OK\n" "$1"
    else
        printf "✗ %-20s NO INSTALADO\n" "$1"
    fi

}

check_flatpak() {

    if ! command -v flatpak >/dev/null 2>&1; then
        echo "Flatpak no instalado"
        return
    fi

    if flatpak list | grep -qi "$1"; then
        echo "✓ $2"
    else
        echo "✗ $2"
    fi

}

echo
echo "Programas"

check_command git
check_command ffmpeg
check_command yt-dlp
check_command flatpak
check_command vlc
check_command obs
check_command audacity
check_command fastfetch


echo
echo "Flatpak"

check_flatpak spotify "Spotify"
check_flatpak discord "Discord"
check_flatpak heroic "Heroic"
check_flatpak bottles "Bottles"
check_flatpak stremio "Stremio"
check_flatpak steam "Steam"


echo
echo "NVIDIA"

if command -v nvidia-smi >/dev/null 2>&1; then
    echo "✓ NVIDIA funcionando"
    nvidia-smi --query-gpu=name,driver_version --format=csv,noheader
else
    echo "✗ NVIDIA no disponible"
fi


echo
echo "DaVinci Resolve"

if [[ -d /opt/resolve ]]; then
    echo "✓ DaVinci Resolve instalado"
else
    echo "✗ DaVinci Resolve no encontrado"
fi


echo
echo "AutoSubs"

if rpm -q auto-subs >/dev/null 2>&1; then
    echo "✓ AutoSubs instalado"
else
    echo "✗ AutoSubs no instalado"
fi


echo
echo "Darkly"

if find /usr -name "org.kde.darkly.so" 2>/dev/null | grep -q .; then
    echo "✓ Darkly instalado"
else
    echo "✗ Darkly no encontrado"
fi


echo
echo "Sistema"

echo "Kernel : $(uname -r)"
echo "Sesión : ${XDG_SESSION_TYPE:-desconocida}"

GPU=$(lspci | grep -i 'vga\|3d' | head -n1 || true)

echo "GPU    : ${GPU:-No detectada}"


echo
echo "=========================================="
echo " Verificación finalizada"
echo "=========================================="
