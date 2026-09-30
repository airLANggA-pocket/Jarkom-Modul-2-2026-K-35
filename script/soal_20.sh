#!/bin/bash
ZONE_FILE="/etc/bind/jarkom/10.81.1.10.com"
echo "[*] Mengembalikan IP Abbey..."
sed -i 's/2026092905/2026092906/g' $ZONE_FILE
sed -i 's/abbey\s*15\s*IN\s*A\s*10.81.99.99/abbey   IN      A       10.81.4.10/g' $ZONE_FILE
service bind9 restart

echo "[*] Mengaktifkan Autostart BIND9..."
update-rc.d bind9 defaults
echo "[+] Node Prab Selesai!"