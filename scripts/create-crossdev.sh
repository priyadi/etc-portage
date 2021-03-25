#!/bin/sh

mkdir -p /var/db/repos/localrepo-crossdev/{profiles,metadata}
echo 'crossdev' > /var/db/repos/localrepo-crossdev/profiles/repo_name
echo 'masters = gentoo' > /var/db/repos/localrepo-crossdev/metadata/layout.conf
echo 'thin-manifests = true' >> /var/db/repos/localrepo-crossdev/metadata/layout.conf
chown -R portage:portage /var/db/repos/localrepo-crossdev
