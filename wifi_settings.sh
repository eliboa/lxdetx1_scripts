#!/bin/sh
# be eliboa
if ! [ -f "../../etc/NetworkManager/system-connections/Gigaspot" ]
then
  echo "/etc/NetworkManager/system-connections/Gigaspot is not a file"
  exit
fi
echo "Enter WiFi SSID (name) : "
read ssid
echo "Enter WiFi password : "
read psk
cat ../../etc/NetworkManager/system-connections/Gigaspot | sed s/ssid=.*/ssid=$ssid/ | sed s/psk=.*/psk=$psk/ > ../../etc/NetworkManager/system-connections/Gigaspot
echo "2 lines edited in /etc/NetworkManager/system-connections/Gigaspot :"
cat ../../etc/NetworkManager/system-connections/Gigaspot | grep 'ssid='
cat ../../etc/NetworkManager/system-connections/Gigaspot | grep 'psk='
