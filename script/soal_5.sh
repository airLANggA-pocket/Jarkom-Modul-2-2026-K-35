#!/bin/bash

ZONE_FILE="/etc/bind/jarkom/k35.com"

# Tambahkan record A
cat << 'EOF' >> "$ZONE_FILE"

alpha   IN      A       10.81.6.10
beta    IN      A       10.81.6.11
gamma   IN      A       10.81.6.12
abbey   IN      A       10.81.4.10
penny   IN      A       10.81.5.10
delta   IN      A       10.81.7.10
epsilon IN      A       10.81.7.11
obladi  IN      A       10.81.1.12
desmond IN      A       10.81.1.13
oblada  IN      A       10.81.1.14
molly   IN      A       10.81.1.15
EOF

# Cek zone file
named-checkzone k35.com "$ZONE_FILE"

# Reload BIND9
service bind9 reload

echo "Record A berhasil ditambahkan."