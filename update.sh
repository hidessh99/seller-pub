#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

clear

cd /root
#System version number
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi

localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi

echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green      Membuat Folder Server        $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear

mkdir -p /etc/xray
mkdir -p /etc/v2ray
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/scdomain
touch /etc/v2ray/scdomain

ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1

apt install git curl -y >/dev/null 2>&1
apt install python -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Aight good ... installation file is ready"
sleep 2

mkdir -p /var/lib/scrz-prem >/dev/null 2>&1
echo "IP=" >> /var/lib/scrz-prem/ipvps.conf

#installer package penting
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green      Update Package Penting           $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear

wget -q https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/tools.sh;chmod +x tools.sh;./tools.sh
rm tools.sh
sleep 2
clear

echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green      Package tambahan VPS           $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear

#command connect vps
wget -O /usr/local/bin/add-ssh-user "https://raw.githubusercontent.com/hidessh99/seller-pub/main/add-ssh-user.sh" && chmod +x /usr/local/bin/add-ssh-user
wget -O /usr/local/bin/add-vmess-user "https://raw.githubusercontent.com/hidessh99/seller-pub/main/add-vmess-user.sh" && chmod +x /usr/local/bin/add-vmess-user
wget -O /usr/local/bin/del-vmess-user "https://raw.githubusercontent.com/hidessh99/seller-pub/main//del-vmess-user.sh" && chmod +x /usr/local/bin/del-vmess-user
sleep 2

echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green      Hapus Log Server           $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear

#remove log
wget -q -O /usr/bin/removelog "https://raw.githubusercontent.com/hidessh99/HIDE-package/main/log.sh" && chmod +x /usr/bin/removelog
#cronjob
echo "30 * * * * root removelog" >> /etc/crontab

wget -q https://raw.githubusercontent.com/hidessh99/seller-pub/main/dns-cf.sh;chmod +x dns-cf.sh;./dns-cf.sh

#hapussemuafile 
rm -rf tools.sh
rm -rf update.sh
