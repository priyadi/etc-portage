#!/bin/sh

# Re-exec the whole run inside emerge.slice so the build competes with the
# desktop on the slice's terms (see systemd/emerge.slice in this repo).
# PORTAGE_NICENESS alone cannot do this: nice only arbitrates within a
# cgroup, and the build and the desktop live in different ones.

if [ -z "${EMERGE_SH_SCOPED}" ]; then
	exec sudo env EMERGE_SH_SCOPED=1 \
		systemd-run --scope --quiet --collect \
		--slice=emerge.slice --description="emerge world update" \
		"$0" "$@"
fi

emerge --sync
eix-update
emerge -DuNav world --keep-going --backtrack 30 --verbose-conflicts \
	&& emerge --depclean \
	&& eclean distfiles \
	&& eclean-kernel
