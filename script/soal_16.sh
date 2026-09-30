#!/bin/bash
apt-get update && apt-get install apache2-utils -y
echo "=== BENCHMARK ABBEY (STATIC) ==="
ab -n 250 -c 10 -H "Host: static.10.81.1.10.com" http://10.81.4.10/
echo "=== BENCHMARK PENNY (WWW) ==="
ab -n 250 -c 10 -H "Host: www.10.81.1.10.com" http://10.81.5.10/