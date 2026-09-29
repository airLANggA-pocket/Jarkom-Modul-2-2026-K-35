#!bin/bash

# Di obladi
apt-get update
apt-get install apache2

service apache2 start

mkdir -p /var/www/html/arsip

nano /etc/apache2/conf-available/arsip.conf

<Directory /var/www/html/arsip>
    Options +Indexes
    AllowOverride None
    Require all granted
</Directory>

a2enconf arsip

service apache2 reload


root@obladi:/# touch /var/www/html/arsip/file1.txt
root@obladi:/# touch /var/www/html/arsip/file2.txt
root@obladi:/# touch /var/www/html/arsip/data.pdf


# Di client lain, misalnya alpha:
lynx http://obladi.k35.com/arsip/