#!/bin/bash
echo "[*] Setup Real-IP Nginx..."
# Masukkan konfigurasi ke dalam blok http di nginx.conf
sed -i '/http {/a \    set_real_ip_from 10.81.4.10;\n    real_ip_header X-Real-IP;' /etc/nginx/nginx.conf
service nginx restart
echo "[+] Setup Real-IP Core Selesai!"