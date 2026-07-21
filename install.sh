#!/usr/bin/env bash

# ======================================================
# Legion Installer v1.0
# Official Pterodactyl Installer
# Copyright (c) 2026 Legion Teknologi
# ======================================================

set -e

VERSION="1.0.0"

GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
BLUE="\e[36m"
RESET="\e[0m"

clear

echo -e "${BLUE}"
cat << "EOF"

██╗     ███████╗ ██████╗ ██╗ ██████╗ ███╗   ██╗
██║     ██╔════╝██╔════╝ ██║██╔═══██╗████╗  ██║
██║     █████╗  ██║  ███╗██║██║   ██║██╔██╗ ██║
██║     ██╔══╝  ██║   ██║██║██║   ██║██║╚██╗██║
███████╗███████╗╚██████╔╝██║╚██████╔╝██║ ╚████║
╚══════╝╚══════╝ ╚═════╝ ╚═╝ ╚═════╝ ╚═╝  ╚═══╝

        Legion Installer v1.0.0
EOF
echo -e "${RESET}"

# Root Check
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}[ERROR] Jalankan sebagai root!${RESET}"
    exit 1
fi

# OS Check
source /etc/os-release

if [[ "$ID" != "ubuntu" ]]; then
    echo -e "${RED}[ERROR] Installer hanya mendukung Ubuntu.${RESET}"
    exit 1
fi

# Version Check
case "$VERSION_ID" in
22.04|24.04)
echo -e "${GREEN}[OK] Ubuntu $VERSION_ID Didukung.${RESET}"
;;
*)
echo -e "${RED}[ERROR] Ubuntu $VERSION_ID Tidak Didukung.${RESET}"
exit 1
;;
esac

echo

echo -e "${YELLOW}Informasi VPS${RESET}"

echo "Hostname : $(hostname)"
echo "OS       : $PRETTY_NAME"
echo "Kernel   : $(uname -r)"
echo "CPU Core : $(nproc)"
echo "RAM      : $(free -h | awk '/Mem:/ {print $2}')"
echo "Disk     : $(df -h / | awk 'NR==2 {print $2}')"

echo

read -p "Lanjut Install Pterodactyl? (y/n): " pilih

if [[ "$pilih" != "y" ]]; then
echo "Dibatalkan."
exit
fi

echo
echo -e "${GREEN}Update Sistem...${RESET}"

apt update -y
apt upgrade -y

apt install -y \
curl \
wget \
git \
zip \
unzip \
tar \
sudo \
nano \
software-properties-common \
ca-certificates \
apt-transport-https \
lsb-release

echo
echo -e "${GREEN}=====================================${RESET}"
echo -e "${GREEN}VPS Siap Untuk Install Pterodactyl.${RESET}"
echo -e "${GREEN}=====================================${RESET}"
