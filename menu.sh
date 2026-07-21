#!/usr/bin/env bash

clear

echo ""
echo "╔════════════════════════════════════════════╗"
echo "║                                            ║"
echo "║        LEGION INSTALLER v1.0              ║"
echo "║                                            ║"
echo "║      Official Legion Teknologi            ║"
echo "║                                            ║"
echo "╚════════════════════════════════════════════╝"

echo ""

echo "1. Install Panel"
echo "2. Install Wings"
echo "3. Install NodeJS"
echo "4. Install Docker"
echo "5. Install Nginx"
echo "6. Install SSL"
echo "7. Install Theme"
echo "8. Backup"
echo "9. Update"
echo "10. Uninstall"

echo ""

read -p "Pilih Menu : " pilih

case $pilih in

1)
bash panel.sh
;;

2)
bash wings.sh
;;

3)
bash node.sh
;;

4)
bash docker.sh
;;

5)
bash nginx.sh
;;

6)
bash ssl.sh
;;

7)
bash theme.sh
;;

8)
bash backup.sh
;;

9)
bash update.sh
;;

10)
bash uninstall.sh
;;

*)
echo "Menu tidak tersedia."
;;

esac
