#!/usr/bin/env -S DOSH_DOCKERFILE=docker/deb/Dockerfile parent=1 dosh --no-doshrc
set -e
dpkg-buildpackage -us -uc "$@"
lintian ../github-workflows*.dsc ../github-workflows*.deb
