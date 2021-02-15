#!/bin/sh

DATE=`date +%Y-%m-%d`
CONFIG=/usr/src/kernel-x86_64-fedora.config
DOTCONFIG=/usr/src/linux/.config
ADDITIONAL=/etc/portage/kernel.config.additional
URL=https://src.fedoraproject.org/rpms/kernel/raw/rawhide/f/kernel-x86_64-fedora.config

wget $URL -O $CONFIG
cp $CONFIG $DOTCONFIG
cat $ADDITIONAL >> $DOTCONFIG
genkernel \
	--initramfs-filename=initramfs-$DATE-%%KV%%.img \
	--kernel-filename=vmlinuz-$DATE-%%KV%% \
	--systemmap-filename=System.map-$DATE-%%KV%% \
	all
