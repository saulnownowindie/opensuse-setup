#!/usr/bin/env bash

set -Eeuo pipefail

echo "=========================================="
echo " Instalando AutoSubs"
echo "=========================================="

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INSTALLER_DIR="$PROJECT_DIR/installers"

echo
echo "Buscando instalador..."

INSTALLER=$(find "$INSTALLER_DIR" \
    -maxdepth 1 \
    -type f \
    -name "AutoSubs*.rpm" \
    | head -n1)

if [[ -z "$INSTALLER" ]]; then
    echo
    echo "No se encontró AutoSubs."
    echo
    echo "Coloca el archivo .rpm dentro de:"
    echo "$INSTALLER_DIR"
    exit 1
fi

if rpm -q auto-subs >/dev/null 2>&1; then
    echo
    echo "AutoSubs ya está instalado."
    exit 0
fi

echo
echo "Verificando DaVinci Resolve..."

if [[ ! -d "/opt/resolve" ]]; then
    echo "DaVinci Resolve no está instalado."
    echo "Instala DaVinci antes de AutoSubs."
    exit 1
fi

echo
echo "Instalador encontrado:"
echo "$INSTALLER"

echo
echo "Instalando dependencias de AutoSubs..."

sudo zypper install -y \
libwebkit2gtk-4_1-0
Mesa-libgbm

echo
echo "Instalando AutoSubs..."

sudo rpm -i --nodeps "$INSTALLER"

echo
echo "Actualizando caché de librerías..."


sudo ldconfig

echo
echo "Aplicando workaround para WebKitGTK (pantalla negra)..."

if [[ -f /usr/bin/autosubs && ! -f /usr/bin/autosubs.real ]]; then
    sudo mv /usr/bin/autosubs /usr/bin/autosubs.real

    sudo tee /usr/bin/autosubs >/dev/null <<'EOF'
#!/usr/bin/env bash

export GDK_BACKEND=x11
export WEBKIT_DISABLE_DMABUF_RENDERER=1

exec /usr/bin/autosubs.real "$@"
EOF

    sudo chmod +x /usr/bin/autosubs

    echo "Workaround aplicado."
else
    echo "Workaround ya aplicado."
fi

echo
echo "Verificando instalación..."

if rpm -q auto-subs >/dev/null 2>&1; then
    echo "AutoSubs instalado correctamente."
else
    echo "No fue posible verificar la instalación."
    exit 1
fi

echo
echo "=========================================="
echo " AutoSubs listo"
echo "=========================================="
