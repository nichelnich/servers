#!/bin/sh

if [ "$1" = "all" ]; then
sudo apt install xl2tpd ppp -y
sudo systemctl stop xl2tpd
sudo systemctl disable xl2tpd
fi

if [ "$1" = "all" ] || [ "$1" = "config" ]; then
sudo cp files/xl2tpd.conf /etc/xl2tpd/xl2tpd.conf
sudo cp files/options.l2tpd /etc/ppp/options.l2tpd
sudo cp /etc/ppp/chap-secrets /etc/ppp/chap-secrets.bak
sudo echo "testname l2tpd testpasswd *" > /etc/ppp/chap-secrets
echo 
fi

echo "============================"
echo "Current Version: $(xl2tpd --version)"
echo "Expect Version: xl2tpd-1.3.12"
