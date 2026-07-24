# openSUSE Setup

Repositorio personal para instalar y configurar automáticamente mi entorno de trabajo en openSUSE Tumbleweed KDE.

## Incluye

- NVIDIA Drivers
- KDE Plasma
- DaVinci Resolve Studio
- AutoSubs
- Darkly
- OBS Studio
- FFmpeg
- Steam
- Heroic
- Discord
- Spotify
- Stremio
- Bottles
- VLC
- Audacity
- Flatpak
- Configuración de KDE
- Scripts de respaldo y restauración

## Estructura

```
opensuse-setup/
├── backup.sh
├── restore.sh
├── install.sh
├── update.sh
├── config/
├── installers/
├── logs/
├── backups/
└── scripts/
```

## Instalación

```bash
git clone https://github.com/TU_USUARIO/opensuse-setup.git
cd opensuse-setup
chmod +x *.sh
chmod +x scripts/*.sh
./install.sh
```

## Antes de instalar

Copiar a `installers/`:

- DaVinci_Resolve_Studio_*.run
- AutoSubs-*.deb

## Después

Se recomienda reiniciar el equipo.
