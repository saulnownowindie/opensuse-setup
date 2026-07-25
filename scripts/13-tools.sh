#!/usr/bin/env bash

set -Eeuo pipefail

echo "=========================================="
echo " Instalando herramientas multimedia"
echo "=========================================="

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo
echo "Instalando dependencias..."

sudo zypper refresh

sudo zypper install -y \
python313-pipx \
nodejs \
ffmpeg \
jq \
wget \
curl


echo
echo "Configurando pipx..."

pipx ensurepath


echo
echo "Instalando yt-dlp..."

if command -v yt-dlp >/dev/null 2>&1; then
    echo "yt-dlp ya está instalado."
    pipx upgrade yt-dlp || true
else
    pipx install yt-dlp
fi


echo
echo "Instalando soporte EJS..."

pipx inject yt-dlp yt-dlp-ejs || true


echo
echo "Buscando perfil de Floorp..."

FLOORP_PROFILE=$(find \
"$HOME/.var/app/one.ablaze.floorp/.floorp" \
-maxdepth 1 \
-type d \
-name "*.default-default" \
| head -n1 || true)


if [[ -z "$FLOORP_PROFILE" ]]; then

    echo
    echo "No se encontró perfil Flatpak de Floorp."
    echo "Los alias funcionarán sin cookies."

    COOKIE_BROWSER="firefox"

else

    echo
    echo "Perfil Floorp encontrado:"
    echo "$FLOORP_PROFILE"

    COOKIE_BROWSER="firefox:$FLOORP_PROFILE"

fi


echo
echo "Configurando alias..."


ALIAS_FILE="$HOME/.bashrc"


cat <<EOF >> "$ALIAS_FILE"


# ======================================
# yt-dlp multimedia
# ======================================

# Descargar videos hasta 1080p
# Compatible con YouTube, TikTok, Instagram,
# Facebook, X y otras plataformas soportadas

alias ytv='yt-dlp \
--js-runtimes node:/usr/bin/node \
--cookies-from-browser "$COOKIE_BROWSER" \
-f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" \
--merge-output-format mp4 \
-o "%(uploader)s - %(title)s.%(ext)s"'


# Descargar audio WAV
# Preparado para edición en DaVinci Resolve

alias yta='yt-dlp \
--js-runtimes node:/usr/bin/node \
--cookies-from-browser "$COOKIE_BROWSER" \
-x \
--audio-format wav \
--audio-quality 0 \
--embed-metadata \
-o "%(artist,uploader)s/%(title)s.%(ext)s"'


EOF


echo
echo "Verificando instalación..."

echo
echo "yt-dlp:"
$HOME/.local/bin/yt-dlp --version || yt-dlp --version


echo
echo "ffmpeg:"
ffmpeg -version | head -n1


echo
echo "node:"
node --version


echo
echo "=========================================="
echo " Herramientas configuradas"
echo "=========================================="

echo
echo "Comandos disponibles:"
echo
echo " ytv URL  -> descargar video MP4 hasta 1080p"
echo " yta URL  -> descargar audio WAV"
echo
echo "Ejecuta:"
echo " source ~/.bashrc"
echo "para activar los alias."
