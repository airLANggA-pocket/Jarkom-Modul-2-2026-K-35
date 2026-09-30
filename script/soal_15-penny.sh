#!/bin/bash
echo "[*] Setup PHP dan /eternal..."
apt-get install -y php libapache2-mod-php
mkdir -p /var/www/eternal
echo "<?php echo '<h1>PHP berhasil dirender pada Penny.</h1>'; ?>" > /var/www/eternal/index.php

sed -i '/<\/VirtualHost>/i \
    Alias /eternal /var/www/eternal\n    <Directory /var/www/eternal>\n        Require all granted\n    </Directory>' /etc/apache2/sites-available/penny-proxy.conf

service apache2 restart
echo "[+] Setup /eternal Selesai!"