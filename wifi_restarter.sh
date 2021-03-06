#!/bin/bash

# TODO: use the routers IP instead of DNS
# The IP for the server you wish to ping (8.8.8.8 is a public Google DNS server)
IP=8.8.8.8

# Only send two pings, sending output to /dev/null
ping -c2 ${IP} > /dev/null

# If the return code from ping ($?) is not 0 (meaning there was an error and the IP was unreachable)
if [ $? != 0 ]
then
    # log things to syslog
    exec 1> >(logger -s -t $(basename $0)) 2>&1
    echo "couldn't ping $IP. restarting wlan0"
    # Restart the wireless interface
    ifdown --force wlan0
    ifup wlan0
fi
