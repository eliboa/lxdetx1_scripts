#!/bin/sh
# by eliboa
CONFF=../../etc/NetworkManager/system-connections/Gigaspot
if ! [ -f "$CONFF" ]
then
  echo "/etc/NetworkManager/system-connections/Gigaspot is not a file"
  exit
fi
echo "Enter WiFi SSID (name) : "
read ssid
echo "Enter WiFi password : "
read psk
cat $CONFF | sed s/ssid=.*/ssid=$ssid/ | sed s/psk=.*/psk=$psk/ > $CONFF"_2"
rm $CONFF
mv $CONFF"_2" $CONFF
chmod 600 $CONFF
echo "2 lines edited in /etc/NetworkManager/system-connections/Gigaspot :"
cat $CONFF | grep 'ssid='
cat $CONFF | grep 'psk='
