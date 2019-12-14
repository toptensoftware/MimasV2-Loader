#!/bin/bash

if [ "$SUDO_USER" == "" ]; then
    echo "Please run as sudo"
    exit 7
fi


rm -rf /opt/MimasV2
rm -f /usr/local/bin/mimasv2-loader
rm -f /etc/udev/rules.d/mimasv2.rules

#gpasswd -d $SUDO_USER mimasv2
