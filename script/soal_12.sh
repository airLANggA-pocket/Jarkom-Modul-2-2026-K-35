#!/bin/bash
echo "[*] Setup Basic Auth /admin..."
apt-get install -y apache2-utils
htpasswd -cb /etc/apache2/.htpasswd prabs pakar_pinter_jadi_gob***

mkdir -p /var/www/admin
echo "<h1>Dokumen Rahasia Sindikat</h1>" > /var/www/admin/index.html
chown -R www-data:www-data /var/www/admin

# Menambahkan blok Directory ke konfigurasi proxy
sed -i '/<\/VirtualHost>/i \
    Alias /admin /var/www/admin\n    <Directory /var/www/admin>\n        AuthType Basic\n        AuthName "Ruang Rahasia Sindikat"\n        AuthUserFile /etc/apache2/.htpasswd\n        Require valid-user\n    </Directory>' /etc/apache2/sites-available/penny-proxy.conf

service apache2 restart
echo "[+] Soal 12 Selesai!"