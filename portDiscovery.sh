#!/bin/bash

function ctrl_c(){
  echo -e "\n\n[!] Saliendo..."
  exit 1
}

#Ctrl+C 
trap ctrl_c INT

for port in $(seq 1 65535); do
  timeout 1 bash -c "echo '' > /dev/tcp/10.10.0.128/$port" 2>/dev/null && echo "[+] 10.10.0.128 - PORT $port OPEN"&
done; wait
