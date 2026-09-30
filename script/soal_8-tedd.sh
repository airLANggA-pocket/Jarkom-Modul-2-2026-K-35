#!/bin/bash

cat << 'EOF' >> /etc/bind/named.conf.local

zone "1.81.10.in-addr.arpa" {
    type slave;
    masters { 10.81.1.10; };
    file "/var/cache/bind/1.81.10.in-addr.arpa";
};

zone "4.81.10.in-addr.arpa" {
    type slave;
    masters { 10.81.1.10; };
    file "/var/cache/bind/4.81.10.in-addr.arpa";
};

zone "5.81.10.in-addr.arpa" {
    type slave;
    masters { 10.81.1.10; };
    file "/var/cache/bind/5.81.10.in-addr.arpa";
};
EOF

# Cek konfigurasi
named-checkconf

# Restart BIND9
service bind9 restart

echo "Reverse DNS Slave selesai."