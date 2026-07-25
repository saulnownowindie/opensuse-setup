#!/usr/bin/env bash

set -Eeuo pipefail

echo "=========================================="
echo " Instalando herramientas multimedia"
echo "=========================================="

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


if [[ -n "$FLOORP_PROFILE" ]]; then

    COOKIE_BROWSER="firefox:$FLOORP_PROFILE"

    echo "Perfil Floorp encontrado:"
    echo "$FLOORP_PROFILE"

else

    COOKIE_BROWSER="firefox"

    echo "No se encontró Floorp Flatpak."
    echo "Usando Firefox estándar."

fi


echo
echo "Configurando alias..."


BASHRC="$HOME/.bashrc"


# Eliminar configuración anterior
sed -i '/# >>> OPEN-SUSE MULTIMEDIA TOOLS >>>/,/# <<< OPEN-SUSE MULTIMEDIA TOOLS <<</d' "$BASHRC"


cat <<EOF >> "$BASHRC"


# >>> OPEN-SUSE MULTIMEDIA TOOLS >>>

# Descargar vídeo hasta 1080p

alias ytv='\$HOME/.local/bin/yt-dlp \
--js-runtimes node:/usr/bin/node \
--cookies-from-browser "$COOKIE_BROWSER" \
-f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" \
--merge-output-format mp4 \
-o "%(uploader)s - %(title)s.%(ext)s"'


# Descargar audio WAV

alias yta='\$HOME/.local/bin/yt-dlp \
--js-runtimes node:/usr/bin/node \
--cookies-from-browser "$COOKIE_BROWSER" \
-x \
--audio-format wav \
--audio-quality 0 \
--embed-metadata \
-o "%(artist,uploader)s/%(title)s.%(ext)s"'


alias pcm='
for file in *.MOV *.mov; do
    [ -e "\$file" ] || continue

    temp="\${file%.*}_pcm_temp.mov"

    echo "Procesando: \$file"

    ffmpeg -y \
    -i "\$file" \
    -map 0:v:0 \
    -map 0:a:0 \
    -c:v copy \
    -c:a pcm_s24le \
    -ar 48000 \
    -ac 2 \
    -map_metadata 0 \
    -movflags use_metadata_tags \
    -metadata:s:v:0 handler_name="Core Media Video" \
    -metadata:s:a:0 handler_name="Core Media Audio" \
    "\$temp"

    if [ -f "\$temp" ]; then
        mv -f "\$temp" "\$file"
        echo "Audio PCM aplicado: \$file"
    else
        echo "Error procesando: \$file"
    fi

done
'


# <<< OPEN-SUSE MULTIMEDIA TOOLS <<<


EOF


echo
echo "Verificando instalación..."

echo
echo "yt-dlp:"
$HOME/.local/bin/yt-dlp --version


echo
echo "ffmpeg:"
ffmpeg -version | head -n1


echo
echo "Node:"
node --version


echo
echo "=========================================="
echo " Herramientas configuradas"
echo "=========================================="

echo
echo "Comandos:"
echo " ytv URL       -> vídeo MP4 hasta 1080p"
echo " yta URL       -> audio WAV"
echo " iphonepcm     -> MOV iPhone a PCM WAV"
echo
echo "Ejecuta:"
echo " source ~/.bashrc"
