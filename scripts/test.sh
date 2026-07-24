#!/bin/bash

if command -v fastfetch >/dev/null; then
    echo "✓ Fastfetch ya está instalado."
else
    echo "Instalando Fastfetch..."
    sudo zypper install -y fastfetch
fi
