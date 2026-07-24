#!/bin/bash

set -euo pipefail

echo "=========================================="
echo " Instalando Darkly"
echo "=========================================="

WORKDIR="$HOME/.cache/opensuse-setup"
REPO="$WORKDIR/Darkly"

echo
echo "Actualizando repositorios..."

sudo zypper refresh

echo
echo "Instalando dependencias..."

sudo zypper install -y \
git \
cmake \
gcc \
gcc-c++ \
kdecoration6-devel \
kf6-extra-cmake-modules \
kf6-frameworkintegration-devel \
kf6-kcmutils-devel \
kf6-kcodecs-devel \
kf6-kcolorscheme-devel \
kf6-kconfig-devel \
kf6-kconfigwidgets-devel \
kf6-kcoreaddons-devel \
kf6-kguiaddons-devel \
kf6-ki18n-devel \
kf6-kiconthemes-devel \
kf6-kirigami-devel \
kf6-kwidgetsaddons-devel \
kf6-kwindowsystem-devel \
qt6-base-devel \
qt6-core-private-devel \
qt6-qml-devel \
qt6-qml-private-devel \
qt6-qmlmeta-private-devel \
qt6-qmlmodels-private-devel \
qt6-qmlworkerscript-private-devel \
qt6-quick-devel \
qt6-quickcontrols2-devel \
qt6-quicktemplates2-private-devel \
qt6-quickwidgets-devel \
qt6-tools \
qt6-tools-devel

mkdir -p "$WORKDIR"

echo
echo "Obteniendo Darkly..."

if [ -d "$REPO/.git" ]; then
    cd "$REPO"
    git pull
else
    git clone https://github.com/Bali10050/Darkly.git "$REPO"
    cd "$REPO"
fi

echo
echo "Compilando..."

rm -rf build
mkdir build
cd build

cmake .. \
    -DBUILD_QT6=ON \
    -DBUILD_QT5=OFF

cmake --build . -j"$(nproc)"

echo
echo "Instalando..."

sudo cmake --install .

echo
echo "Verificando..."

if [ -f /usr/lib64/qt6/plugins/org.kde.kdecoration2/org.kde.darkly.so ]; then
    echo "✓ Darkly instalado correctamente."
else
    echo "⚠ No se pudo verificar la instalación."
fi

echo
echo "=========================================="
echo " Darkly listo"
echo "=========================================="
