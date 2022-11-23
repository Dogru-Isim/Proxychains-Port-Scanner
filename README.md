# Proxychains-Port-Scanner
Nmap is slow enough when is comes to proxychains, here is a fast port scanner that runs with proxychains4 an netcat.
##### Note: This may break the port forward in some cases, if that happens, just change the sleep value on line 35"

Usage:
```shell
  ./scan.sh ip start_port end_port"
  ./scan.sh ip 80,443,3389,5986"
  ./scan.sh ip 80,"  Notice the comma for single port
```
