#!/bin/bash

# Jalankan di oblada
# Update dan install package
apt-get update
apt install nginx php php-fpm -y

# Buat direktori website
mkdir -p /var/www/jarkom

# Buat index.php
cat << 'EOF' > /var/www/jarkom/index.php
<!DOCTYPE html>
<html>
<head>
    <title>Aplikasi</title>
</head>
<body>
    <h1>Halaman Beranda</h1>
    <p>Selamat datang di website Core Oblada.</p>
    <a href="/profil">Profil</a>
</body>
</html>
EOF

# Buat profil.php
cat << 'EOF' > /var/www/jarkom/profil.php
<!DOCTYPE html>
<html>
<head>
    <title>Profil</title>
</head>
<body>
    <h1>Halaman Profil</h1>
    <p>Ini adalah halaman profil.</p>
    <a href="/">Beranda</a>
</body>
</html>
EOF

# Konfigurasi Nginx
cat << 'EOF' > /etc/nginx/sites-available/default
server {
    listen 80;
    listen [::]:80;

    root /var/www/jarkom;

    index index.php;
    server_name _;

    location / {
        try_files $uri $uri/ $uri.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.4-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }

    error_log /var/log/nginx/jarkom_error.log;
    access_log /var/log/nginx/jarkom_access.log;
}
EOF

# Cek konfigurasi Nginx
nginx -t

# Restart Nginx
service nginx restart

echo "Konfigurasi Oblada selesai."
echo "Website: http://oblada.k35.com/"
echo "Profil : http://oblada.k35.com/profil"