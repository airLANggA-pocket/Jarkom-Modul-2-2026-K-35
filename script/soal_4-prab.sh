#!bin/bash

# Jalankan pada prab
apt-get update

apt-get install bind9 -y

ln -s /etc/init.d/named /etc/init.d/bind9
mkdir -p /etc/bind/jarkom

# Konfigurasi named.conf.local
cat << 'EOF' > /etc/bind/named.conf.local
zone "k35.com" {
    type master;
    notify yes;
    also-notify { 10.81.1.11; };
    allow-transfer { 10.81.1.11; };
    file "/etc/bind/jarkom/k35.com";
};
EOF

# Zone file k35.com
cat << 'EOF' > /etc/bind/jarkom/k35.com
$TTL    604800
@       IN      SOA     prab.k35.com. admin.k35.com. (
                        2026092801
                        604800
                        86400
                        2419200
                        604800 )
;

@       IN      NS      prab.k35.com.
@       IN      NS      tedd.k35.com.

prab    IN      A       10.81.1.10
tedd    IN      A       10.81.1.11
@       IN      A       10.81.5.10
EOF

# Konfigurasi DNS options
cat << 'EOF' > /etc/bind/named.conf.options
options {
    directory "/var/cache/bind";

    forwarders {
        192.168.122.1;
    };

    allow-query { any; };
    auth-nxdomain no;
    listen-on { any; };
    listen-on-v6 { any; };
};
EOF

# Lalu restart bind9
service bind9 restart