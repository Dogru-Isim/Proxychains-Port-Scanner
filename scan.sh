#!/bin/env bash

ip=$1
start_port=$2
end_port=$3

if [[ $1 == "-h" || $1 == "help" || $1 == "--help" || $1 == "" ]]; then
  echo "Usage: ./scan.sh ip start_port end_port"
  echo "       ./scan.sh ip 80,443,3389,5986"
  echo "       ./scan.sh ip 80,"  Notice the comma for single port
  echo
  echo "Note: The tool may break the port forward in some cases,  if that happens, just change the sleep value on line 35"

  exit 0
fi

if [[ $start_port == *","* ]]; then
  scan_ports=($(echo $start_port | sed 's/,/ /g'))  # Convert to array
  for i in ${scan_ports[@]}; do
    printf "Trying: $ip:$i\r"
    ( proxychains4 /usr/bin/nc -vz $ip $i 2>&1 | grep "OK" | tee -a open-ports.txt) &  # -a to work with processes
    /bin/sleep 0.05

    if [[ $i == ${scan_ports[-1]} ]]; then
      echo "Scan finished, waiting for last ports to respond"
      /bin/sleep 10
      break
    fi
  done

  exit 0
fi

for ((i=start_port;i<=end_port;i++)); do
  printf "Trying: $ip:$i\r"
  ( proxychains4 /usr/bin/nc -vz $ip $i 2>&1 | egrep "OK" | tee -a open-ports.txt) &  # -a to work with processes
  /bin/sleep 0.05

  if [[ $i == $end_port ]]; then
    echo "Scan finished, waiting for last ports to respond"
    /bin/sleep 10
    break
  fi
done
