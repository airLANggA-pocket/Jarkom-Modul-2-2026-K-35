#!/bin/bash

mkdir -p /etc/bind/jarkom

# Tambahkan konfigurasi reverse zone
cat << 'EOF' >> /etc/bind/named.conf.local

zone "1.81.10.in-addr.arpa" {
    type master;
    notify yes;
    also-notify { 10.81.1.11; };
    allow-transfer { 10.81.1.11; };
    file "/etc/bind/jarkom/1.81.10.in-addr.arpa";
};

zone "4.81.10.in-addr.arpa" {
    type master;
    notify yes;
    also-notify { 10.81.1.11; };
    allow-transfer { 10.81.1.11; };
    file "/etc/bind/jarkom/4.81.10.in-addr.arpa";
};

zone "5.81.10.in-addr.arpa" {
    type master;
    notify yes;
    also-notify { 10.81.1.11; };
    allow-transfer { 10.81.1.11; };
    file "/etc/bind/jarkom/5.81.10.in-addr.arpa";
};
EOF

# Reverse zone di 10.81.1.0/24
cat << 'EOF' > /etc/bind/jarkom/1.81.10.in-addr.arpa
$TTL 604800
@ IN SOA k35.com. root.k35.com. (
    2026092901
    604800
    86400
    2419200
    604800
)

@ IN NS prab.k35.com.

12 IN PTR obladi.k35.com.
13 IN PTR desmond.k35.com.
14 IN PTR oblada.k35.com.
15 IN PTR molly.k35.com.
EOF

# Reverse zone 10.81.4.0/24
cat << 'EOF' > /etc/bind/jarkom/4.81.10.in-addr.arpa
$TTL 604800
@ IN SOA k35.com. root.k35.com. (
    2026092901
    604800
    86400
    2419200
    604800
)

@ IN NS prab.k35.com.

10 IN PTR abbey.k35.com.
EOF

# Reverse zone 10.81.5.0/24
cat << 'EOF' > /etc/bind/jarkom/5.81.10.in-addr.arpa
$TTL 604800
@ IN SOA k35.com. root.k35.com. (
    2026092901
    604800
    86400
    2419200
    604800
)

@ IN NS prab.k35.com.

10 IN PTR penny.k35.com.
EOF

# Cek konfigurasi
named-checkconf

named-checkzone 1.81.10.in-addr.arpa \
    "/etc/bind/jarkom/1.81.10.in-addr.arpa"

named-checkzone 4.81.10.in-addr.arpa \
    "/etc/bind/jarkom/4.81.10.in-addr.arpa"

named-checkzone 5.81.10.in-addr.arpa \
    "/etc/bind/jarkom/5.81.10.in-addr.arpa"

# Reload BIND9
service bind9 reload

echo "Reverse DNS Master selesai."