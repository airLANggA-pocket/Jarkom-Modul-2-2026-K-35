#!/bin/bash
ZONE_FILE="/etc/bind/jarkom/10.81.1.10.com"

echo "[*] Menambahkan TXT, CNAME, dan Modifikasi IP Abbey (TTL 15)..."

# Naikkan serial SOA
sed -i 's/2026092902/2026092905/g' $ZONE_FILE

# Modifikasi A record Abbey ke IP fiktif + TTL
sed -i 's/abbey\s*IN\s*A\s*10.81.4.10/abbey   15      IN      A       10.81.99.99/g' $ZONE_FILE

# Tambahkan record baru di akhir file
cat << 'EOF' >> $ZONE_FILE

; TXT Records
alpha   IN      TXT     "alpha"
beta    IN      TXT     "beta"
gamma   IN      TXT     "gamma"
delta   IN      TXT     "delta"
epsilon IN      TXT     "epsilon"

; CNAME Outbound
outbound    IN      CNAME   http.badssl.com.
EOF

service bind9 restart
echo "[+] Konfigurasi DNS Soal 17-19 Selesai!"