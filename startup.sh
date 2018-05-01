#!/bin/sh
# be eliboa, only execute on arch linux LXDE running on Nntendo Sitch
do_once=true
i=1
while $do_once || [[ -z "$ssh" ]]; do
  ssh=`systemctl status sshd.service | grep 'active (running)'`
  do_once=false
  i=$(($i + 1))
  if [[ $i -eq 3 ]]
  then
    echo "Waiting for ssh service..."
  fi
  if [[ $i -gt 500 ]]
  then
    echo "A problem occured, please check the wifi connection"
    exit
  fi
done

do_once=true
i=1
while $do_once || [[ -z "$IP_ADRESS" ]]; do
  IP_ADRESS=`ifconfig wlp1s0 | grep 'netmask' | sed -e 's/.*inet\(.*\)netmask.*/\1/'`
  do_once=false
  i=$(($i + 1))
  if [[ $i -eq 3 ]]
  then
    echo "Waiting for wlan..."
  fi
  if [[ $i -gt 500 ]]
  then
    echo "A problem occured, wlan network device not found. If it's the first boot, please reboot."
    exit
  fi
done

echo "### ######        #    ######  ######  ######  #######  #####   ##### "
echo " #  #     #      # #   #     # #     # #     # #       #     # #     #"
echo " #  #     #     #   #  #     # #     # #     # #       #       #      "
echo " #  ######     #     # #     # #     # ######  #####    #####   ##### "
echo " #  #          ####### #     # #     # #   #   #             #       #"
echo " #  #          #     # #     # #     # #    #  #       #     # #     #"
echo "### #          #     # ######  ######  #     # #######  #####   ##### "

echo ""
echo "***********************************************************************"
echo "                              $IP_ADRESS"
echo "***********************************************************************"
SSH_STATUS=`systemctl status sshd.service | grep 'Active:' | sed -e 's/.*Active:\(.*\)/\1/'`
echo "***********************************************************************"
echo "                          SSH SERVER STATUS"
echo "                          -----------------"
echo "     $SSH_STATUS"
echo "***********************************************************************"
echo -n 'Press any key to exit'
read input
exit
