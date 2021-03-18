#!/bin/sh

date=`date +%Y-%m-%d`
genkernel \
	--initramfs-filename=initramfs-$date-%%KV%%.img \
	--kernel-filename=vmlinuz-$date-%%KV%% \
	--systemmap-filename=System.map-$date-%%KV%% \
	all
