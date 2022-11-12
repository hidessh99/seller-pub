#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
clear

    
#install ssh ovpn
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green      Install SSH / WS               $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/ssh/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
#Instal Xray
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green          Install XRAY              $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear

wget https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/xray/hideinst-xrayv5.sh && chmod +x hideinst-xrayv5.sh && ./hideinst-xrayv5.sh
sleep 2
clear
wget https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/sshws/insshws.sh && chmod +x insshws.sh && ./insshws.sh
sleep 2
clear

#hapus semua dokumen 
cd
rm -rf hideinst-xrayv5.sh
rm -rf insshws.sh
rm -rf ssh-vpn.sh
rm -rf installer.sh
