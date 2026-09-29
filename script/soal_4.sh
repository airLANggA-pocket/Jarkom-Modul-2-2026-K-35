#!bin/bash

# Jalankan pada prab
apt-get update

apt-get install bind9 -y

ln -s /etc/init.d/named /etc/init.d/bind9

nano /etc/bind/named.conf.local

# isinya:
zone "K35.com" {
  type master;
  notify yes;
  also-notify { 10.81.1.11; };
  allow-transfer { 10.81.1.11; };
  file "/etc/bind/jarkom/k35.com";
};

mkdir /etc/bind/jarkom
nano /etc/bind/jarkom/k35.com

# isinya:
$TTL    604800          ; Waktu cache default (detik)
@       IN      SOA     prab.k35.com. admin.k35.com. (
                        2026092801 ; Serial (format YYYYMMDDXX)
                        604800     ; Refresh (1 minggu)
                        86400      ; Retry (1 hari)
                        2419200    ; Expire (4 minggu)
                        604800 )   ; Negative Cache TTL
;

@       IN      NS      prab.k35.com.
@       IN      NS      tedd.k35.com.
prab    IN      A       10.81.1.10
tedd    IN      A       10.81.1.11
@       IN      A       10.81.5.10

nano /etc/bind9/named.conf.options
# isinya


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


# Lalu restart
service bin9 restart

# Coba ping dari tedd
ping -c 5 k35.com

# Berhasil

# Kemudian, DNS Slave pada tedd
apt-get update
apt-get install bind9 -y
ln -s /etc/init.d/named /etc/init.d/bind9
service bind9 restart

# Di tedd, tambahkan
nano /etc/bind/named.conf.local
zone "k35.com" {
    type slave;
    masters { 10.81.1.10; }; // Masukan IP VPC1 tanpa tanda petik
    file "/var/cache/bind/k35.com";
};

service bind9 restart

# Kembali ke prab
service bind9 stop

# Di tedd
ping -c 5 k35.com # ada hasilnya meskipun prab mati

# Ke semua host non route
echo "nameserver 10.81.1.10
nameserver 10.81.1.11
nameserver 192.168.122.1" > /etc/resolv.conf

# Test dari client lain (bebas)
dig k35.com
Harus ada
Answer Section:
K35.com 604800 IN A 10.81.5.10