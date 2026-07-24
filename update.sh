#!/bin/bash

set -e

echo "Actualizando openSUSE..."

sudo zypper refresh
sudo zypper dup -y

echo
echo "Sistema actualizado."
