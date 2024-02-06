#!/bin/bash 


network_prefix=$1 
dns_server=$2

echo "dns resolution for 10.0.5" 


for host in $(seq 1 254); do 
  nslookup $network_prefix.$host $dns_server | grep name
done
