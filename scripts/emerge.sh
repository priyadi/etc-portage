#!/bin/sh

sudo eix-sync
sudo emerge -DuNav world --keep-going --backtrack 30 \
	&& sudo emerge --depclean \
	&& sudo eclean distfiles \
	&& sudo eclean-kernel
