#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in post-fs-data mode
# More info in the main Magisk thread

# Set CF DNS servers address
resetprop -n net.eth0.dns1 94.140.14.14
resetprop -n net.eth0.dns2 94.140.15.15

resetprop -n net.dns1 94.140.14.14
resetprop -n net.dns2 94.140.15.15

resetprop -n net.ppp0.dns1 94.140.14.14
resetprop -n net.ppp0.dns2 94.140.15.15

resetprop -n net.rmnet0.dns1 94.140.14.14
resetprop -n net.rmnet0.dns2 94.140.15.15

resetprop -n net.rmnet1.dns1 94.140.14.14
resetprop -n net.rmnet1.dns2 94.140.15.15

resetprop -n net.pdpbr1.dns1 94.140.14.14
resetprop -n net.pdpbr1.dns2 94.140.15.15

resetprop -n 2606:4700:4700::1111
resetprop -n 2606:4700:4700::1001



# Edit the resolv conf file if it exist

if [ -a /system/etc/resolv.conf ]; then
	mkdir -p $MODDIR/system/etc/
	printf "nameserver 94.140.14.14\nnameserver 94.140.15.15" >> $MODDIR/system/etc/resolv.conf
	chmod 644 $MODDIR/system/etc/resolv.conf
fi
