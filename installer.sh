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

#package tambahan
wget -q -O /usr/bin/add-ws "https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/xray/hide-add-vray.sh" && chmod +x /usr/bin/add-ws
wget -q -O /usr/bin/add-vless "https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/xray/hide-add-vless.sh" && chmod +x /usr/bin/add-vless
wget -q -O /usr/bin/add-tr "https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/xray/hide-add-tr.sh" && chmod +x /usr/bin/add-tr
wget -q -O /usr/bin/del-user "https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/xray/del-ws.sh" && chmod +x /usr/bin/del-user
wget -q -O /usr/bin/cek-user "https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/xray/cek-ws.sh" && chmod +x /usr/bin/cek-ws
wget -q -O /usr/bin/renew-user "https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/xray/renew-ws.sh" && chmod +x /usr/bin/renew-user
wget -q -O /usr/bin/crtv2ray "https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/xray/crt.sh" && chmod +x /usr/bin/crtv2ray
wget -q -O /usr/bin/add-ssws "https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/xray/hide-add-ss.sh" && chmod +x /usr/bin/add-ssws
sleep 1


#hapus semua dokumen 
cd
rm -rf hideinst-xrayv5.sh
rm -rf insshws.sh
rm -rf ssh-vpn.sh
rm -rf installer.sh

echo "=====================-[ HideSSH ]-===================="
echo ""
echo "------------------------------------------------------------"
echo ""
echo ""
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - SSH Websocket           : 80 [OFF]" | tee -a log-install.txt
echo "   - SSH SSL Websocket       : 443" | tee -a log-install.txt
echo "   - Stunnel4                : 447, 777" | tee -a log-install.txt
echo "   - Dropbear                : 109, 143" | tee -a log-install.txt
echo "   - Badvpn                  : 7100-7900" | tee -a log-install.txt
echo "   - Nginx                   : 81" | tee -a log-install.txt
echo "   - XRAY  Vmess TLS         : 443" | tee -a log-install.txt
echo "   - XRAY  Vmess None TLS    : 80" | tee -a log-install.txt
echo "   - XRAY  Vless TLS         : 443" | tee -a log-install.txt
echo "   - XRAY  Vless None TLS    : 80" | tee -a log-install.txt
echo "   - Trojan GRPC                 : 443" | tee -a log-install.txt
echo "   - Trojan WS               : 443" | tee -a log-install.txt
echo "   - Sodosok WS/GRPC           : 443" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On           : $aureb:00 $gg GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - AutoKill Multi Login User" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Fully automatic script" | tee -a log-install.txt
echo "   - VPS settings" | tee -a log-install.txt
echo "   - Admin Control" | tee -a log-install.txt
echo "   - Change port" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo ""
echo ""
echo "------------------------------------------------------------"
echo ""
