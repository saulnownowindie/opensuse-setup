#!/bin/bash

set -e

echo "=================================="
echo "Instalando AutoSubs"
echo "=================================="

INSTALLER="$HOME/Instaladores/AutoSubs-linux-x86_64.deb"

if [ ! -f "$INSTALLER" ]; then
    echo
    echo "❌ No se encontró:"
    echo "$INSTALLER"
    exit 1
fi

sudo zypper install -y "$INSTALLER"

echo
echo "✓ AutoSubs instalado."
