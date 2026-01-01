#!/bin/sh

# sudo systemd-run --pty --wait   --nice=19   -p CPUQuota=600% -p CPUWeight=5 -p IOWeight=5   -p IOSchedulingClass=idle   bash -lc 'emerge -DuNav world --keep-going'


sudo emerge --sync
sudo eix-update
sudo emerge -DuNav world --keep-going --backtrack 30 --verbose-conflicts \
	&& sudo emerge --depclean \
	&& sudo eclean distfiles \
	&& sudo eclean-kernel
