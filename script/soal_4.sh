#!bin/bash

# Pada setiap node, jalankan resolver prab, tedd, dan 192.168.122.1
echo "nameserver 10.81.1.10
nameserver 10.81.1.11
nameserver 192.168.122.1" > /etc/resolv.conf

# Test dari client lain (bebas)
dig k35.com