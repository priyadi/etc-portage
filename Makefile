all:

symlink-kde-keywords:
	cd package.accept_keywords ; rm kde-* ; for A in `ls /var/db/repos/kde/Documentation/package.accept_keywords/*.keywords | grep -v 9999 | grep -v live` ; do ln -s $$A ; done
