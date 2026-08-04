all:

symlink-kde-keywords:
	cd package.accept_keywords ; rm kde-* ; for A in `ls /var/db/repos/kde/Documentation/package.accept_keywords/*.keywords | grep -v 9999 | grep -v live` ; do ln -s $$A ; done

install-slice:
	install -m 0644 -o root -g root systemd/emerge.slice /etc/systemd/system/emerge.slice ; systemctl daemon-reload

# Build trees are pure scratch, so nodatacow drops the CoW fragmentation and
# the zstd compression btrfs would otherwise apply to them. The flag only
# affects files created after it is set -- new subdirectories inherit it from
# the parent -- so an already-populated tmpdir has to be emptied to benefit.
install-fs:
	@T=$$(portageq envvar PORTAGE_TMPDIR) ; \
	install -d -o portage -g portage "$$T" ; \
	if [ -n "$$(ls -A "$$T")" ] ; then \
		echo "warning: $$T is not empty; +C will only apply to files created from now on" ; \
	fi ; \
	chattr +C "$$T" ; \
	lsattr -d "$$T"
