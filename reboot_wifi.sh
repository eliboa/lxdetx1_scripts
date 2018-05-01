#!/bin/sh
WLAN=`ip link | grep "wlp1s0"`
if [ -z "$WLAN" ];
then
  if ! [ -f "/home/alarm/first_reboot" ]
  then
    echo "null" > /home/alarm/first_reboot
    sudo systemctl reboot
  fi
else
  sudo rm /home/alarm/first_reboot
fi
