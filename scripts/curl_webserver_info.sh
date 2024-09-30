#!/bin/bash

IP_ADDRESSES=(
    "http://192.168.56.101/"
    "http://192.168.56.102/"
    "http://192.168.56.103/"
)

echo "---------------------------------------------"
# Loop through each IP address and execute curl
for IP in "${IP_ADDRESSES[@]}"; do
    echo "Check web server for $IP"
    curl -I "$IP" 2>/dev/null | grep -i "Server:" | sed $'s/^/\t/'
    echo "---------------------------------------------"
done
