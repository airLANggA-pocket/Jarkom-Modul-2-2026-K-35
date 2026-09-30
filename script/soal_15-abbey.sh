#!/bin/bash
echo "[*] Setup Static /orion..."
mkdir -p /var/www/orion
echo "<h1>Halaman Statis Orion (Abbey) Berhasil!</h1>" > /var/www/orion/index.html
chown -R www-data:www-data /var/www/orion

sed -i '/location \/ {/i \
    location /orion {\n        alias /var/www/orion/;\n        index index.html;\n    }' /etc/nginx/sites-available/abbey-proxy.conf

nginx -t && service nginx restart
echo "[+] Setup /orion Selesai!"