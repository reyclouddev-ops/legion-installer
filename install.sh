#!/usr/bin/env bash

clear

GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
NC='\033[0m'

if [[ $EUID -ne 0 ]]; then
echo -e "${RED}Harus dijalankan sebagai root!${NC}"
exit
fi

apt update -y
apt install curl wget unzip git sudo lsb-release -y

bash menu.sh
