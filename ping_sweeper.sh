#!/bin/bash

for ((i=2; 1<=50; i++)); do
    ip="10.0.5.$i"
    if ping -c 1 -W 1 $ip > /dev/null 2>&1; then
        echo "$ip is up" >> sweep.txt
    fi
done
