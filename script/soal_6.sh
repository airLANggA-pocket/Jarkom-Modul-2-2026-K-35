#!bin/bash

# Cek di tedd

dig @10.81.1.10 k35.com SOA # Cek apakah serial soa nya sama dengan prab
dig @10.81.1.11 k35.com SOA

# Lihat apakah zone transfer berjalan
# Jalankan di tedd
dig @10.81.1.11 k35.com AXFR

Ada banyak log client

