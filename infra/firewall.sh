#!/usr/bin/env bash
set -euo pipefail
iptables -F; iptables -X
iptables -t nat -F; iptables -t mangle -F
iptables -P INPUT DROP; iptables -P FORWARD DROP; iptables -P OUTPUT ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 80  -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
# ejemplo de restricción SSH (ajústalo o quítalo)
# iptables -A INPUT -p tcp -s 160.114.0.0/16 --dport 22 -j ACCEPT
echo "Reglas aplicadas."
