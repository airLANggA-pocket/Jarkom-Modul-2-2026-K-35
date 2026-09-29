#!bin/bash

# Di prab
# Di /etc/bind/named.conf.local

zone "k35.com" {
  type master;
  notify yes;
  also-notify { 10.81.1.11; };
  allow-transfer { 10.81.1.11; };
  file "/etc/bind/jarkom/k35.com";
};

# Tambahkan bagian ini
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


# Tambahkan di /etc/bind/jarkom/1.81.10.in-addr.arpa
nano /etc/bind/jarkom/1.81.10.in-addr.arpa

$TTL    604800          ; Waktu cache default (detik)
@       IN      SOA     k35.com. root.k35.com. (
                        2026092901 ; Serial (format YYYYMMDDXX)
                        604800     ; Refresh (1 minggu)
                        86400      ; Retry (1 hari)
                        2419200    ; Expire (4 minggu)
                        604800 )   ; Negative Cache TTL
;

@       IN      NS      prab.k35.com.

12      IN      PTR     obladi.k35.com.
13      IN      PTR     desmond.k35.com.
14      IN      PTR     oblada.k35.com.
15      IN      PTR     molly.k35.com.


# Di /etc/bind/jarkom/4.81.10.in-addr.arpa
nano /etc/bind/jarkom/4.81.10.in-addr.arpa

$TTL    604800          ; Waktu cache default (detik)
@       IN      SOA     k35.com. root.k35.com. (
                        2026092901 ; Serial (format YYYYMMDDXX)
                        604800     ; Refresh (1 minggu)
                        86400      ; Retry (1 hari)
                        2419200    ; Expire (4 minggu)
                        604800 )   ; Negative Cache TTL
;

@       IN      NS      prab.k35.com.

10      IN      PTR     abbey.k35.com.


# Di /etc/bind/jarkom/5.81.10.in-addr.arpa
nano /etc/bind/jarkom/5.81.10.in-addr.arpa

$TTL    604800          ; Waktu cache default (detik)
@       IN      SOA     k35.com. root.k35.com. (
                        2026092901 ; Serial (format YYYYMMDDXX)
                        604800     ; Refresh (1 minggu)
                        86400      ; Retry (1 hari)
                        2419200    ; Expire (4 minggu)
                        604800 )   ; Negative Cache TTL
;

@       IN      NS      prab.k35.com.

10      IN      PTR     penny.k35.com.

# Cek 3 zone

named-checkzone 1.81.10.in-addr.arpa /etc/bind/jarkom/1.81.10.in-addr.arpa
named-checkzone 4.81.10.in-addr.arpa /etc/bind/jarkom/4.81.10.in-addr.arpa
named-checkzone 5.81.10.in-addr.arpa /etc/bind/jarkom/5.81.10.in-addr.arpa

service bind9 reload

# Di tedd

nano /etc/bind/named.conf.local

zone "k35.com" {
    type slave;
    masters { 10.81.1.10; }; // Masukan IP VPC1 tanpa tanda petik
    file "/var/cache/bind/k35.com";
};

# Tambahkan ini
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

service bind9 restart

#Cek 
dig @10.81.1.10 4.81.10.in-addr.arpa AXFR
