#!/bin/bash

# Jalankan di obladi
# Update dan install Apache2
apt-get update
apt-get install apache2 -y

# Jalankan Apache2
service apache2 start

# Buat direktori arsip
mkdir -p /var/www/html/arsip

# Buat konfigurasi arsip
cat << 'EOF' > /etc/apache2/conf-available/arsip.conf
<Directory /var/www/html/arsip>
    Options +Indexes
    AllowOverride None
    Require all granted
</Directory>
EOF

# Aktifkan konfigurasi
a2enconf arsip

# Cek konfigurasi Apache
apache2ctl configtest

# Reload Apache
service apache2 reload

# Isi direktori arsip
touch /var/www/html/arsip/file1.txt
touch /var/www/html/arsip/file2.txt
touch /var/www/html/arsip/data.pdf

echo "Konfigurasi arsip selesai."
echo "Akses: http://obladi.k35.com/arsip/"