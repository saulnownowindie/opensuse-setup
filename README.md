# openSUSE Setup

Mi configuración personal de openSUSE Tumbleweed KDE.

## 🚀 Instalación rápida

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/saulnownowindie/opensuse-setup/main/bootstrap.sh)
```

## ¿Qué instala?

- Drivers NVIDIA
- KDE Plasma
- DaVinci Resolve Studio
- AutoSubs
- Darkly
- FFmpeg
- OBS Studio
- Steam
- Heroic Games Launcher
- Discord
- Spotify
- Stremio
- Bottles
- VLC
- Audacity
- Configuración personal de KDE
- Scripts de respaldo y restauración

## Requisitos

Antes de ejecutar el instalador, copia a la carpeta `installers/`:

- `DaVinci_Resolve_Studio_*.run`
- `AutoSubs-*.deb`

Luego ejecuta:

```bash
./install.sh
```

para activar davinci pegar linea por linea

cd /opt/resolve

sudo perl -pi -e 's/\x03\x00\x89\x45\xFC\x83\x7D\xFC\x00\x74\x11\x48\x8B\x45\xC8\x8B/\x03\x00\x89\x45\xFC\x83\x7D\xFC\x00\xEB\x11\x48\x8B\x45\xC8\x8B/g' bin/resolve

sudo perl -pi -e 's/\x74\x11\x48\x8B\x45\xC8\x8B\x55\xFC\x89\x50\x58\xB8\x00\x00\x00/\xEB\x11\x48\x8B\x45\xC8\x8B\x55\xFC\x89\x50\x58\xB8\x00\x00\x00/g' bin/resolve

sudo perl -0777 -pi -e 's/\x74(.\xBF\x16\x00\x00\x00\xBE.\x01\x00\x00\xE8..\x05)/\x75$1/g' bin/resolve

sudo mkdir -p .license

echo -e "LICENSE blackmagic davinciresolvestudio 999999 permanent uncounted\n hostid=ANY issuer=CGP customer=CGP issued=28-dec-2023\n akey=0000-0000-0000-0000 _ck=00 sig=\"00\"" | sudo tee .license/blackmagic.lic
