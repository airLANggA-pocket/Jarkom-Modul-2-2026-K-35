#!/bin/bash
echo "[*] Setup Reverse Proxy Apache (Penny)..."
apt-get update && apt-get install -y apache2
a2enmod proxy proxy_http proxy_balancer lbmethod_byrequests headers
a2dissite 000-default.conf

cat > /etc/apache2/sites-available/penny-proxy.conf << 'EOF'
<VirtualHost *:80>
    ServerName penny.10.81.1.10.com
    ServerAlias www.10.81.1.10.com vault.10.81.1.10.com

    ProxyRequests Off
    ProxyPreserveHost On

    <Proxy "balancer://vault">
        BalancerMember http://10.4.13.4
        BalancerMember http://10.4.13.5
        ProxySet lbmethod=byrequests
    </Proxy>

    RequestHeader set X-Real-IP %{REMOTE_ADDR}s
    RequestHeader set X-Forwarded-For %{REMOTE_ADDR}s
    RequestHeader set X-Forwarded-Proto %{REQUEST_SCHEME}s

    ProxyPass / balancer://vault/
    ProxyPassReverse / balancer://vault/
</VirtualHost>
EOF

a2ensite penny-proxy.conf
apache2ctl configtest && service apache2 restart
echo "[+] Soal 11 Penny Selesai!"