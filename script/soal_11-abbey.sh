#!/bin/bash
echo "[*] Setup Reverse Proxy Nginx (Abbey)..."
apt-get update && apt-get install -y nginx
rm -f /etc/nginx/sites-enabled/default

cat > /etc/nginx/sites-available/abbey-proxy.conf << 'EOF'
upstream core {
    server 10.4.13.6;
    server 10.4.13.7;
}

server {
    listen 80;
    server_name abbey.10.81.1.10.com static.10.81.1.10.com core.10.81.1.10.com;

    location / {
        proxy_pass http://core;
        proxy_set_header Host              $host;
        proxy_set_header X-Real-IP         $remote_addr;
        proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
EOF

ln -sf /etc/nginx/sites-available/abbey-proxy.conf /etc/nginx/sites-enabled/
nginx -t && service nginx restart
echo "[+] Soal 11 Abbey Selesai!"