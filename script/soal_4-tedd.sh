#!bin/bash

# DNS Slave pada tedd
apt-get update
apt-get install bind9 -y

ln -s /etc/init.d/named /etc/init.d/bind9

# Di tedd, tambahkan
cat << 'EOF' > /etc/bind/named.conf.local
zone "k35.com" {
    type slave;
    masters { 10.81.1.10; };
    file "/var/cache/bind/k35.com";
};
EOF

named-checkconf

service bind9 restart