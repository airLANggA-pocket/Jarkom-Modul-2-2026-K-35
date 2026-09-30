#!bin/bash

# Konfigurasi

# Di konfigurasi router
```   
   up sysctl -w net.ipv4.ip_forward=1
   up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
   up iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
   up iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT
   up iptables -A FORWARD -i eth3 -o eth0 -j ACCEPT
   up iptables -A FORWARD -i eth4 -o eth0 -j ACCEPT
   up iptables -A FORWARD -i eth5 -o eth0 -j ACCEPT
   up iptables -A FORWARD -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT 
```

# Konfigurasi setiap node
# rootkit
cat << 'EOF' > /etc/network/interfaces
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
    address 10.81.1.1
    netmask 255.255.255.0

auto eth2
iface eth2 inet static
    address 10.81.4.1
    netmask 255.255.255.0

auto eth3
iface eth3 inet static
    address 10.81.5.1
    netmask 255.255.255.0

auto eth4
iface eth4 inet static
    address 10.81.6.1
    netmask 255.255.255.0

auto eth5
iface eth5 inet static
    address 10.81.7.1
    netmask 255.255.255.0
EOF

# alpha
cat << 'EOF' > /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.81.6.10
	netmask 255.255.255.0
	gateway 10.81.6.1
EOF

# beta
cat << 'EOF' > /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.81.6.11
	netmask 255.255.255.0
	gateway 10.81.6.1
EOF

# gamma
cat << 'EOF' > /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.81.6.12
	netmask 255.255.255.0
	gateway 10.81.6.1
EOF

# abbey
cat << 'EOF' > /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.81.4.10
	netmask 255.255.255.0
	gateway 10.81.4.1
EOF

# penny
cat << 'EOF' > /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.81.5.10
	netmask 255.255.255.0
	gateway 10.81.5.1
EOF

# delta
cat << 'EOF' > /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.81.7.10
	netmask 255.255.255.0
	gateway 10.81.7.1
EOF

# epsilon
cat << 'EOF' > /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.81.7.11
	netmask 255.255.255.0
	gateway 10.81.7.1
EOF

# prab
cat << 'EOF' > /etc/network/interfaces
auto eth0
iface eth0 inet static
    address 10.81.1.10
    netmask 255.255.255.0
    gateway 10.81.1.1
EOF

# tedd
cat << 'EOF' > /etc/network/interfaces
auto eth0
iface eth0 inet static
    address 10.81.1.11
    netmask 255.255.255.0
    gateway 10.81.1.1
EOF

# obladi
cat << 'EOF' > /etc/network/interfaces
auto eth0
iface eth0 inet static
    address 10.81.1.12
    netmask 255.255.255.0
    gateway 10.81.1.1
EOF

# desmond
cat << 'EOF' > /etc/network/interfaces
auto eth0
iface eth0 inet static
    address 10.81.1.13
    netmask 255.255.255.0
    gateway 10.81.1.1
EOF

# oblada
cat << 'EOF' > /etc/network/interfaces
auto eth0
iface eth0 inet static
    address 10.81.1.14
    netmask 255.255.255.0
    gateway 10.81.1.1
EOF

# molly
cat << 'EOF' > /etc/network/interfaces
auto eth0
iface eth0 inet static
    address 10.81.1.15
    netmask 255.255.255.0
    gateway 10.81.1.1
EOF


