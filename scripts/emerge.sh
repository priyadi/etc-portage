#!/bin/sh

sudo emerge --sync
sudo eix-update
sudo emerge -DuNav world --keep-going --backtrack 30 --verbose-conflicts \
	&& sudo emerge --depclean \
	&& sudo eclean distfiles \
	&& sudo eclean-kernel
