# Proxychains-Port-Scanner
A fast port scanner that runs with proxychains4 an netcat.

Ports will both be displayed and saved to a file called open-ports.txt

Usage:
```shell
./scan.sh ip start_port end_port
./scan.sh ip 80,443,3389,5986
./scan.sh ip 80,  # (Notice the comma for single port)
```

#### Note: The tool may break the port forward in some cases, if that happens, just change the sleep value on line 35

## Ongoing scan:
![scan ongoing](https://github.com/Dogru-Isim/Proxychains-Port-Scanner/blob/main/img/scan-ongoing.png?raw=true)

## Finished scan:
![scan finished](https://github.com/Dogru-Isim/Proxychains-Port-Scanner/blob/main/img/scan-finished.png?raw=true)
