#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'

IP=$(wget -qO- ifconfig.me/ip);
domain=$(cat /etc/v2ray/domain)

read -p "Username : " Login
read -p "Password : " Pass

ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
useradd -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Thank You For Using Our Services"
echo -e "SSH Account Info"
echo -e "Username       : $Login "
echo -e "Password       : $Pass"
echo -e "==============================="
echo -e "Domain         : $domain"
echo -e "Host           : $IP"
echo -e "OpenSSH        : 22"
echo -e "Dropbear       : 109, 143"
echo -e "SSL/TLS        :$ssl"
echo -e "Port Suid      :$sqd"
echo -e "Port Websocket : 443, 8880"
echo -e "badvpn         : 7100-7300"
echo -e "==============================="
echo -e "PAYLOAD"                                                          
echo -e "GET / HTTP/1.1[crlf]Host: $domain[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "==============================="
echo -e "SETING HOST SSH"               
echo -e "bugisisendiri:2082@$Login:$Pass"
echo -e "==============================="
