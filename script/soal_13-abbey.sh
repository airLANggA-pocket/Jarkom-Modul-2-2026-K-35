#!/bin/bash
echo "[*] Setup Redirect 302 Nginx..."
cat > /etc/nginx/sites-available/abbey-redirect.conf << 'EOF'
server {
    listen 80;
    server_name abbey.10.81.1.10.com 10.81.4.10;
    return 302 http://static.10.81.1.10.com$request_uri;
}
EOF

ln -sf /etc/nginx/sites-available/abbey-redirect.conf /etc/nginx/sites-enabled/
nginx -t && service nginx restart
echo "[+] Redirect 302 Abbey Selesai!"