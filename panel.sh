#!/usr/bin/env bash

clear

GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[1;36m'
NC='\033[0m'

echo -e "${CYAN}"
echo "======================================"
echo "    LEGION PANEL INSTALLER"
echo "======================================"
echo -e "${NC}"

echo "Memeriksa sistem..."

if [ ! -f /etc/os-release ]; then
    echo -e "${RED}Sistem operasi tidak didukung.${NC}"
    exit 1
fi

source /etc/os-release

echo ""
echo "OS       : $PRETTY_NAME"
echo "Hostname : $(hostname)"
echo "Kernel   : $(uname -r)"
echo "RAM      : $(free -h | awk '/Mem:/ {print $2}')"
echo "CPU Core : $(nproc)"
echo ""

read -p "Lanjutkan instalasi? (y/n): " lanjut

if [[ "$lanjut" != "y" ]]; then
    echo "Instalasi dibatalkan."
    exit
fi

echo ""
echo "Update repository..."
apt update -y

echo ""
echo "Menginstal dependency dasar..."

apt install -y \
curl \
wget \
git \
zip \
unzip \
tar \
sudo \
software-properties-common \
ca-certificates \
gnupg \
lsb-release

echo ""
echo -e "${GREEN}✓ Dependency dasar berhasil dipasang.${NC}"

echo ""
echo "Tahap berikutnya:"
echo "✓ PHP"
echo "✓ MariaDB"
echo "✓ Redis"
echo "✓ Composer"
echo "✓ Nginx"
echo "✓ Pterodactyl Panel"

echo ""
