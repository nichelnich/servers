#!/bin/sh

if [ "$1" = "all" ]; then
sudo apt install pptpd -y
sudo systemctl stop pptpd
sudo systemctl disable pptpd
fi

if [ "$1" = "all" ] || [ "$1" = "config" ]; then
sudo cp files/pptpd.conf /etc/pptpd.conf
sudo cp files/options.pptp /etc/ppp/options.pptp
sudo cp /etc/ppp/chap-secrets /etc/ppp/chap-secrets.bak
sudo echo "testname pptpd testpasswd *" > /etc/ppp/chap-secrets
fi


echo "============================"
echo "Current Version: $(pptpd --version)"
echo "Expect Version: pptpd v1.4.0"
