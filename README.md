# openSUSE Creator & Gaming Workstation Installer

## La configuración profesional para editores de vídeo y gamers en Linux con KDE Plasma

Creado por:

**Saúl González**\
Editor audiovisual y parte de **Indie Now**

Instagram: https://instagram.com/saulnownow

Indie Now: https://instagram.com/indienownow

------------------------------------------------------------------------

# Sobre el proyecto

Proyecto para transformar una instalación limpia de:

    openSUSE Tumbleweed
    +
    KDE Plasma
    +
    NVIDIA

en una workstation Linux para:

-   Edición de vídeo profesional.
-   Creación de contenido.
-   Producción audiovisual.
-   Gaming.

------------------------------------------------------------------------

# Características

## Audiovisual

Incluye:

-   DaVinci Resolve 21.
-   Compatible con DaVinci Resolve Free y Studio.
-   AutoSubs.
-   FFmpeg.
-   Herramientas multimedia.
-   Conversión de audio profesional.

## Gaming

Incluye:

-   Steam nativo RPM.
-   Vulkan.
-   GameMode.
-   MangoHUD.
-   Proton.

------------------------------------------------------------------------

# Codecs multimedia

## H.264

Codec usado por cámaras, móviles y redes sociales.

Ventajas: - Alta compatibilidad. - Buen equilibrio calidad/tamaño.

## H.265 / HEVC

Usado por iPhone modernos y cámaras 4K.

Ventaja: - Mejor compresión manteniendo calidad.

## AAC

Audio comprimido usado por móviles.

Ventaja: - Archivos pequeños.

Desventaja: - Menos ideal para edición profesional.

## PCM

Audio sin compresión.

Configuración:

    PCM 24-bit
    48 kHz
    Stereo

El alias `pcm` reemplaza AAC del iPhone por PCM manteniendo el vídeo sin
recodificar.

------------------------------------------------------------------------

# DaVinci Resolve 21

Instalación preparada para Linux:

-   Dependencias necesarias.
-   Integración KDE.
-   Compatibilidad NVIDIA.

Compatible:

-   DaVinci Resolve Free.
-   DaVinci Resolve Studio.

No requiere licencia Studio para funcionar.

------------------------------------------------------------------------

# AutoSubs

Generación automática de subtítulos.

Compatible:

-   DaVinci Resolve Free.
-   DaVinci Resolve Studio.

No necesita versión Studio.

------------------------------------------------------------------------

# Herramientas multimedia

## yt-dlp

Instalado mediante pipx.

Incluye:

-   yt-dlp-ejs.
-   Node.js.
-   Cookies Floorp.

## ytv

Descarga vídeo hasta 1080p en MP4.

``` bash
ytv URL
```

## yta

Descarga audio WAV.

``` bash
yta URL
```

## pcm

Convierte audio iPhone:

    AAC → PCM 24-bit 48kHz

manteniendo el vídeo original.

------------------------------------------------------------------------

# Gaming Workstation

## 14-gaming.sh

Instala:

-   Steam RPM.
-   Vulkan.
-   GameMode.
-   MangoHUD.

Steam nativo ofrece mejor integración con NVIDIA y Proton.

------------------------------------------------------------------------

# Instalación

``` bash
git clone https://github.com/saulnownowindie/opensuse-setup.git

cd opensuse-setup

chmod +x install.sh

./install.sh
```

------------------------------------------------------------------------

# Autor

Saúl González

Editor audiovisual y parte de Indie Now.

Instagram:

https://instagram.com/saulnownow

https://instagram.com/indienownow

------------------------------------------------------------------------

# Tecnologías

-   openSUSE Tumbleweed
-   KDE Plasma
-   NVIDIA
-   DaVinci Resolve
-   AutoSubs
-   FFmpeg
-   yt-dlp
-   Steam
-   Vulkan
-   Proton
-   Flatpak
-   Bash
