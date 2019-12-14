#!/bin/bash

if [ "$SUDO_USER" == "" ]; then
    echo "Please run as sudo"
    exit 7
fi

# Install python and requires python libs
#apt-get install -y python3 python3-pip
#pip3 install pyserial xmodem

cp -r ./MimasV2 /opt/
ln -sf /opt/MimasV2/mimasv2-prog /usr/local/bin/mimasv2-prog

# Setup for use as non-root
usermod -a -G dialout $SUDO_USER
chgrp dialout /usr/local/bin/mimasv2-prog
rulestr1="SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"2a19\", ATTRS{idProduct}==\"1002\", GROUP=\"dialout\""
echo $rulestr1 > /etc/udev/rules.d/mimasv2.rules
echo
echo "Note: to work without sudo, logout/login and replug any connected boards (or reboot)"
