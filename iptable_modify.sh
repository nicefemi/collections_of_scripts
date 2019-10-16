
#!/bin/bash
#iptables -I INPUT 1 -p tcp -s 128.249.13.144/24 -j ACCEPT && iptables -I OUTPUT 1 -p tcp -s 128.249.13.144/24 -j ACCEPT && iptables -I INPUT 1 -p tcp -s 192.168.2.0/16 -j ACCEPT && iptables -I OUTPUT 1 -p tcp -s 192.168.2.0/16 -j ACCEPT &&iptables -I INPUT 1 -p tcp -s 192.168.1.0/16 -j ACCEPT && iptables -I OUTPUT 1 -p tcp -s 192.168.1.0/16 -j ACCEPT && iptables-save


iptables -I INPUT 1 -p tcp -s 10.66.4.127/24 -j ACCEPT
iptables -I OUTPUT 1 -p tcp -s 10.66.4.127/24 -j ACCEPT
iptables -I INPUT 1 -p tcp -s 192.168.2.0/16 -j ACCEPT
iptables -I OUTPUT 1 -p tcp -s 192.168.2.0/16 -j ACCEPT
iptables -I INPUT 1 -p tcp -s 192.168.1.0/16 -j ACCEPT
iptables -I OUTPUT 1 -p tcp -s 192.168.1.0/16 -j ACCEPT
iptables -I INPUT 1 -p tcp -s 10.11.11.185 -j ACCEPT
iptables -I OUTPUT 1 -p tcp -s 10.11.11.185 -j ACCEPT

iptables-save
