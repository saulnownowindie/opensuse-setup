# openSUSE Creator Workstation Installer

## La configuración profesional para editores de vídeo en Linux con KDE Plasma

Instalador automatizado para convertir una instalación limpia de
**openSUSE Tumbleweed + KDE Plasma** en una estación de trabajo preparada
para creación audiovisual.

Diseñado principalmente para:

- Editores de vídeo.
- Creadores de contenido.
- Productores audiovisuales.
- Usuarios de DaVinci Resolve en Linux.
- Personas que buscan un flujo profesional sin abandonar Linux.

El proyecto automatiza la instalación y configuración de:

- DaVinci Resolve.
- AutoSubs.
- NVIDIA CUDA.
- FFmpeg.
- Herramientas multimedia.
- yt-dlp.
- Conversión de audio profesional.
- KDE Plasma personalizado.

---

# Objetivo del proyecto

Crear una workstation Linux completa para edición audiovisual usando:

- openSUSE Tumbleweed.
- KDE Plasma.
- GPU NVIDIA.
- DaVinci Resolve.
- Herramientas libres y profesionales.

La configuración está pensada para trabajar con:

- Grabaciones de cámaras.
- Grabaciones de iPhone.
- Vídeos H.264/H.265.
- Audio profesional.
- Contenido para YouTube, TikTok e Instagram.
- Proyectos 1080p y 4K.

---

# Características principales

## Sistema

Automatiza:

- Actualización del sistema.
- Instalación de dependencias.
- Configuración inicial.
- Limpieza del sistema.
- Verificación final.

---

# Requisitos

Sistema:

```
openSUSE Tumbleweed
KDE Plasma
```

Recomendado:

- GPU NVIDIA.
- 16 GB RAM o más.
- SSD.
- Espacio suficiente para DaVinci Resolve.

---

# Estructura del proyecto

```
opensuse-setup/

├── install.sh
│
├── config/
│   └── settings.conf
│
├── installers/
│   ├── DaVinci_Resolve_Studio.run
│   └── AutoSubs.rpm
│
├── scripts/
│
│   ├── 01-system.sh
│   ├── 02-repositories.sh
│   ├── 03-multimedia.sh
│   ├── 04-nvidia.sh
│   ├── 05-packages.sh
│   ├── 06-flatpak.sh
│   ├── 07-davinci.sh
│   ├── 08-autosubs.sh
│   ├── 09-kde.sh
│   ├── 10-darkly.sh
│   ├── 11-cleanup.sh
│   ├── 12-verify.sh
│   └── 13-tools.sh
│
└── logs/
```

---

# Instalador principal

## install.sh

Es el controlador principal.

Funciones:

- Detecta openSUSE.
- Mantiene permisos sudo.
- Ejecuta todos los módulos.
- Guarda logs.
- Permite activar o desactivar componentes.
- Muestra resumen final.

---

# Configuración

Archivo:

```
config/settings.conf
```

Controla los módulos:

```bash
INSTALL_SYSTEM=true
INSTALL_REPOSITORIES=true
INSTALL_MULTIMEDIA=true
INSTALL_NVIDIA=true
INSTALL_PACKAGES=true
INSTALL_FLATPAK=true
INSTALL_DAVINCI=true
INSTALL_AUTOSUBS=true
INSTALL_KDE=true
INSTALL_DARKLY=true
RUN_CLEANUP=true
RUN_VERIFY=true
```

---

# Módulos

## 01-system.sh

Configuración base del sistema.

Incluye:

- Actualizaciones.
- Herramientas esenciales.
- Preparación inicial.

---

## 02-repositories.sh

Configura repositorios necesarios para:

- Multimedia.
- NVIDIA.
- Paquetes adicionales.

---

## 03-multimedia.sh

Instala soporte multimedia:

- FFmpeg.
- Codecs.
- Librerías necesarias.

Preparado para:

- DaVinci Resolve.
- Conversión de vídeo.
- Edición de audio.

---

## 04-nvidia.sh

Configura la GPU NVIDIA.

Pensado para:

- RTX 2060 Super.
- CUDA.
- Aceleración por GPU.

---

## 05-packages.sh

Instala aplicaciones generales:

- Utilidades.
- Herramientas del sistema.
- Programas comunes.

---

## 06-flatpak.sh

Configura Flatpak.

Permite instalar aplicaciones aisladas
manteniendo el sistema limpio.

---

# DaVinci Resolve

## 07-davinci.sh

Instala:

## DaVinci Resolve Studio 21

Preparado para:

- KDE Plasma.
- NVIDIA.
- CUDA.
- Edición profesional.

Incluye:

- Instalación automática.
- Dependencias.
- Librerías necesarias.

Instalación:

```
/opt/resolve
```

Compatible con:

- DaVinci Resolve Free.
- DaVinci Resolve Studio.

---

# AutoSubs

## 08-autosubs.sh

Instala:

## AutoSubs

Herramienta para generar subtítulos automáticamente.

Compatibilidad:

✅ DaVinci Resolve Free  
✅ DaVinci Resolve Studio

No requiere una licencia Studio.

El script instala:

- AutoSubs.
- Dependencias necesarias.
- Compatibilidad con openSUSE RPM.

Pensado para:

- Subtítulos automáticos.
- Contenido para redes sociales.
- Vídeos de YouTube.
- Entrevistas.

---

# KDE Plasma

## 09-kde.sh

Configura:

- Entorno KDE.
- Ajustes visuales.
- Mejoras del escritorio.

---

# Darkly

## 10-darkly.sh

Instala:

- Tema oscuro Darkly.
- Personalización visual KDE.

---

# Limpieza

## 11-cleanup.sh

Realiza:

- Limpieza de paquetes.
- Eliminación de archivos temporales.
- Preparación final.

---

# Verificación

## 12-verify.sh

Comprueba:

- NVIDIA.
- FFmpeg.
- DaVinci.
- Herramientas instaladas.

---

# Herramientas multimedia

## 13-tools.sh

Instala:

- FFmpeg.
- Node.js.
- yt-dlp.
- yt-dlp-ejs.
- pipx.
- jq.
- curl.
- wget.

---

# yt-dlp

Instalado mediante:

```
pipx
```

Ventajas:

- No modifica Python del sistema.
- Instalación aislada.
- Fácil actualización.

Incluye:

```
yt-dlp-ejs
```

para compatibilidad con los nuevos sistemas de protección de YouTube.

---

# Integración con Floorp

Detecta automáticamente:

```
~/.var/app/one.ablaze.floorp/.floorp/
```

Usa cookies del navegador para:

- YouTube.
- Sitios compatibles.
- Contenido con autenticación del usuario.

---

# Alias multimedia

## ytv

Descarga vídeos.

Uso:

```bash
ytv URL
```

Características:

- Hasta 1080p.
- MP4.
- Combina vídeo y audio.
- Compatible con múltiples plataformas soportadas por yt-dlp.

---

## yta

Descarga audio.

Uso:

```bash
yta URL
```

Características:

- WAV.
- Preparado para edición.
- Compatible con DaVinci Resolve.

---

## pcm

Optimización de grabaciones iPhone.

Uso:

```bash
pcm
```

Convierte:

```
AAC del iPhone
        ↓
PCM 24-bit 48kHz
```

Mantiene:

- Vídeo original.
- Resolución.
- Calidad visual.
- Metadatos.

Pensado para:

- DaVinci Resolve.
- Edición profesional.
- Mejor compatibilidad de audio en Linux.

---

# Flujo recomendado

## iPhone

Grabación:

```
MOV + AAC
```

Ejecutar:

```bash
pcm
```

Resultado:

```
MOV + PCM
```

Después:

```
DaVinci Resolve
```

---

# Instalación

Clonar:

```bash
git clone https://github.com/saulnownowindie/opensuse-setup.git
```

Entrar:

```bash
cd opensuse-setup
```

Ejecutar:

```bash
chmod +x install.sh
./install.sh
```

---

# Logs

Cada instalación genera:

```
logs/install-fecha.log
```

---

# Proyecto

Configuración personalizada para una workstation Linux enfocada en:

- Edición audiovisual.
- DaVinci Resolve.
- Creación de contenido.
- Producción multimedia.

Basada en:

```
openSUSE Tumbleweed
+
KDE Plasma
+
NVIDIA
```
para activar davinci pegar linea por linea

cd /opt/resolve

sudo perl -pi -e 's/\x03\x00\x89\x45\xFC\x83\x7D\xFC\x00\x74\x11\x48\x8B\x45\xC8\x8B/\x03\x00\x89\x45\xFC\x83\x7D\xFC\x00\xEB\x11\x48\x8B\x45\xC8\x8B/g' bin/resolve

sudo perl -pi -e 's/\x74\x11\x48\x8B\x45\xC8\x8B\x55\xFC\x89\x50\x58\xB8\x00\x00\x00/\xEB\x11\x48\x8B\x45\xC8\x8B\x55\xFC\x89\x50\x58\xB8\x00\x00\x00/g' bin/resolve

sudo perl -0777 -pi -e 's/\x74(.\xBF\x16\x00\x00\x00\xBE.\x01\x00\x00\xE8..\x05)/\x75$1/g' bin/resolve

sudo mkdir -p .license

echo -e "LICENSE blackmagic davinciresolvestudio 999999 permanent uncounted\n hostid=ANY issuer=CGP customer=CGP issued=28-dec-2023\n akey=0000-0000-0000-0000 _ck=00 sig=\"00\"" | sudo tee .license/blackmagic.lic
