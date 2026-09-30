#!/bin/bash
echo "[*] Setup Redirect 301 Apache..."
a2enmod rewrite
sed -i '/<VirtualHost \*:80>/a \
    RewriteEngine On\n    RewriteCond %{HTTP_HOST} ^10.81.5.10$ [OR]\n    RewriteCond %{HTTP_HOST} ^penny\\.10\\.81\\.1\\.10\\.com$\n    RewriteRule ^(.*)$ http://www.10.81.1.10.com$1 [R=301,L]' /etc/apache2/sites-available/penny-proxy.conf

service apache2 restart
echo "[+] Redirect 301 Penny Selesai!"