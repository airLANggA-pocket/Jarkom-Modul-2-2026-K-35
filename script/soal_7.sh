#!bin/bash

# Tambahkan di /etc/bind/jarkom/k35.com
www     IN      CNAME   penny.k35.com.
static  IN      CNAME   abbey.k35.com.
vault   IN      CNAME   obladi.k35.com.
core    IN      CNAME   oblada.k35.com.

# Naikkan serial SOA nya sebelum disimpan

service bind9 reload

# Cek di 2 client lain (bebas)

dig www.k35.com
dig vault.k35.com
dig static.k35.com
dig core.k35.com CNAME

# Harus ada 

