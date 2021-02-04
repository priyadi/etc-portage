#!/bin/sh

CONFIG=/usr/src/kernel-x86_64-fedora.config
DOTCONFIG=/usr/src/linux/.config
ADDITIONAL=/etc/portage/kernel.config.additional
URL=https://src.fedoraproject.org/rpms/kernel/raw/rawhide/f/kernel-x86_64-fedora.config

wget $URL -O $CONFIG
cp $CONFIG $DOTCONFIG
cat $ADDITIONAL >> $DOTCONFIG
