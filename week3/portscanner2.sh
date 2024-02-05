!/bin/bash 


network_prefix=$1
port=$2

 
echo "host,port"
 

for host in $(seq 1 254); do
  current_host="$network_prefix.$host"
  timeout .1 bash -c "echo >/dev/tcp/$current_host/$port" 2>/dev/null &&
    echo "$current_host,$port"
done
