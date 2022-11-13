#!/bin/bash

cd /usr/bin/
wget -O cek-ws "https://raw.githubusercontent.com/bracoli/v4/main/xray/cek-ws.sh" && chmod +x cek-ws
wget -O cek-vless "https://raw.githubusercontent.com/bracoli/v4/main/xray/cek-vless.sh" && chmod +x cek-vless
wget -O cek-tr "https://raw.githubusercontent.com/bracoli/v4/main/xray/cek-tr.sh" && chmod +x cek-tr
wget -O userdelexpired "https://gitlab.com/hidessh/baru/-/raw/main/userdelexpired.sh" && chmod +x userdelexpired.sh


cd
echo "0 17 * * * root clear-log" >> /etc/crontab
echo "50 * * * * root userdelexpired" >> /etc/crontab
